import 'dart:async';

import '../../models/errors/error_type.dart';
import '../../models/user/login_model.dart';
import '../../models/user/user_model.dart';
import '../../models/user/user_response.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/preferences/preferences_repository.dart';
import '../../utils/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final PreferencesRepository _preferencesRepository;
  AuthBloc(
      {AuthRepository authRepository,
      PreferencesRepository preferencesRepository})
      : this._authRepository = authRepository,
        this._preferencesRepository = preferencesRepository,
        super(AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      yield* _mapLoginEventToState(user: event.user, password: event.password);
    } else if (event is SingOutEvent) {
      yield* _mapSingOutEventToState(event);
    } else if (event is GetUserEvent) {
      yield* _mapGetUserEventToState();
    } else if (event is ClearAuthEvent) {
      yield AuthState.initial();
    } else if (event is SetVerifyUserEvent) {
      yield state.copyWith(user: event.user);
    }
  }

  /// Obtener la información del usuario
  ///
  /// Hace uso del metodo [verify] del [AuthRepository] para obtener la
  /// información del usuario y actualizarla en [AuthBloc]
  Stream<AuthState> _mapGetUserEventToState() async* {
    yield state.copyWith(loading: true);
    try {
      final UserResponse response = await _authRepository.verify();
      if (response.code == 200) {
        yield state.copyWith(
          loading: false,
          user: response.data,
          error: ErrorType.noError,
        );
      }
    } on DioError catch (error) {
      if (error.type == DioErrorType.DEFAULT) {
        yield state.copyWith(error: ErrorType.noInternet, loading: false);
        yield state.copyWith(error: ErrorType.noData);
        yield AuthState.initial();
      } else if (error.type == DioErrorType.RESPONSE) {
        if (error.response.statusCode == 401) {
          yield state.copyWith(error: ErrorType.sessionExpired, loading: false);
        } else {
          yield state.copyWith(error: ErrorType.noData, loading: false);
        }
      }
    }
  }

  /// Cerrar Sesión
  ///
  /// Elimina de las preferencias del usuario el token de acceso
  Stream<AuthState> _mapSingOutEventToState(SingOutEvent event) async* {
    _preferencesRepository.remove("token");
    _preferencesRepository.remove("logged");
  }

  /// Login
  ///
  /// Envia las credenciales de acceso al servidor y si son correctas retornan
  /// la información del usuario junto a un token de acceso
  Stream<AuthState> _mapLoginEventToState(
      {String user, String password}) async* {
    // FCM TOKEN para la implementacion de notificaciones push
    String fcmToken = "token";

    // Indicamos que esta cargando
    yield state.copyWith(loading: true);

    // Creamos nuestra instancia de login

    LoginModel login = LoginModel((b) => b
      ..user = user
      ..password = password
      ..fcmToken = fcmToken);

    try {
      final UserResponse response = await _authRepository.login(login);
      logger.v(response);
      if (response.code == 200) {
        logger.i("LOGIN EXITOSO");
        // Guardamos el token
        _preferencesRepository.save<String>("token", response.data.token);
        _preferencesRepository.save<bool>("logged", true);
        // Si la respuesta es exitosa actualizamos el estado
        yield state.copyWith(
            loading: false,
            error: ErrorType.noError,
            user: response.data,
            loginSucces: true);
      }
    } on DioError catch (error) {
      if (error.type == DioErrorType.DEFAULT) {
        logger.e("ERROR DE SERVIDOR");
        logger.e(error.type);
        yield state.copyWith(error: ErrorType.noInternet, loading: false);
        yield AuthState.initial();
      } else if (error.type == DioErrorType.RESPONSE) {
        yield state.copyWith(error: ErrorType.noData, loading: false);
        logger.e("ERROR DE RESPUESTA");
        logger.e("CODIGO: ${error.response.statusCode}");
        logger.e("MENSAJE: ${error.response.data['message']}");
        yield state.copyWith(error: ErrorType.noError, loading: false);
      }
    }
  }
}
