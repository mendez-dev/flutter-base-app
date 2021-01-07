import 'dart:async';

import 'package:base_app/src/blocs/refresh/refresh_bloc.dart';
import 'package:base_app/src/helpers/built_values_helpers.dart';
import 'package:base_app/src/models/errors/error_type.dart';
import 'package:base_app/src/models/user_example/user_example_model.dart';
import 'package:base_app/src/models/user_example/user_example_response.dart';
import 'package:base_app/src/repositories/data/data_repository.dart';
import 'package:base_app/src/utils/logger.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({DataRepository dataRepository})
      : this._dataRepository = dataRepository,
        super(UsersState.initial());

  final DataRepository _dataRepository;

  @override
  Stream<UsersState> mapEventToState(
    UsersEvent event,
  ) async* {
    if (event is GetUsersEvent) {
      yield UsersState.initial();
      yield* _mapGetUsersEventToState();
    } else if (event is RefreshUsersEvent) {
      yield* _mapGetUsersEventToState();
    } else if (event is LoadMoreUsersEvent) {
      yield* _mapLoadMoreUsersEventToState();
    } else if (event is ClearUsersEvent) {
      yield UsersState.initial();
    }
  }

  Stream<UsersState> _mapGetUsersEventToState() async* {
    yield state.copyWith(loading: true);
    try {
      final UserExampleResponse response =
          await _dataRepository.getUsers(page: 1, registers: 1);
      if (response.code == 200) {
        yield state.copyWith(
            loading: false,
            totalPage: response.data.pages,
            currentPage: response.data.current,
            userExampleList: response.data.users,
            refreshStatus: RefreshStatus.canRefresh,
            error: ErrorType.noError);
      }
    } on DioError catch (error) {
      logger.e(error);
      if (error.type == DioErrorType.DEFAULT) {
        yield state.copyWith(
            error: ErrorType.noInternet,
            loading: false,
            refreshStatus: RefreshStatus.canRefresh);
        yield state.copyWith(error: ErrorType.noData);
      } else if (error.type == DioErrorType.RESPONSE) {
        yield state.copyWith(
            error: ErrorType.noData,
            loading: false,
            refreshStatus: RefreshStatus.canRefresh);
        // Si el token es invalido
        if (error.response.statusCode == 401) {
          yield state.copyWith(error: ErrorType.sessionExpired);
          // Reiniciamos el bloc
          yield UsersState.initial();
        }

        String message = error.response.data["message"];
        logger.e("MENSAJE: $message");
      }
    }
  }

  Stream<UsersState> _mapLoadMoreUsersEventToState() async* {
    if (state.currentPage + 1 <= state.totalPage) {
      yield state.copyWith(loading: true);
      try {
        final UserExampleResponse response = await _dataRepository.getUsers(
            page: state.currentPage + 1, registers: 1);

        BuiltList<UserExampleModel> users = BuiltValuesHelpers()
            .joinBuiltList(state.userExampleList, response.data.users);
        if (response.code == 200) {
          yield state.copyWith(
              loading: false,
              totalPage: response.data.pages,
              currentPage: response.data.current,
              userExampleList: users,
              refreshStatus: RefreshStatus.canRefresh,
              error: ErrorType.noError);
        }
      } on DioError catch (error) {
        logger.e(error);
        if (error.type == DioErrorType.DEFAULT) {
          yield state.copyWith(
              error: ErrorType.noInternet,
              loading: false,
              refreshStatus: RefreshStatus.canRefresh);
          yield state.copyWith(error: ErrorType.noData);
        } else if (error.type == DioErrorType.RESPONSE) {
          yield state.copyWith(
              error: ErrorType.noData,
              loading: false,
              refreshStatus: RefreshStatus.canRefresh);
          // Si el token es invalido
          if (error.response.statusCode == 401) {
            yield state.copyWith(error: ErrorType.sessionExpired);
            // Reiniciamos el bloc
            yield UsersState.initial();
          }

          String message = error.response.data["message"];
          logger.e("MENSAJE: $message");
        }
      }
    }
  }
}
