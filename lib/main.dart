import 'package:base_app/src/blocs/preferences/preferences_bloc.dart';
import 'package:base_app/src/utils/logger.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/blocs/auth/auth_bloc.dart';
import 'src/config/const.dart';
import 'src/models/user/user_response.dart';
import 'src/repositories/auth/auth_reporitory_impl.dart';
import 'src/repositories/network/network_repository.dart';
import 'src/repositories/preferences/preferences_repository_impl.dart';

void main() async {
  // Indica si el usuario ya esta autenticado
  bool logged = false;

  // Se llama este metodo cuando se necesita ejecutar codigo nntes de llamar el
  // primer widget
  WidgetsFlutterBinding.ensureInitialized();

  final preferencesRepository = PreferencesRepositoryImpl();
  // ignore: close_sinks
  final preferencesBloc =
      PreferencesBloc(preferencesRepository: preferencesRepository);

  final networkRepository =
      NetworkRepository(baseUrl: BASE_URL, preferences: preferencesRepository);
  final authRepository = AuthRepositoryImpl(networkRepository);

  // ignore: close_sinks
  final authBloc = AuthBloc(
      authRepository: authRepository,
      preferencesRepository: preferencesRepository);

  try {
    UserResponse response = await authRepository.verify();

    if (response.code == 200) {
      // Enviando la informacion del usuario
      authBloc.add(SetVerifyUserEvent(user: response.data));
      logged = true;
      logger.i("TOKEN VALIDO SESION INICIADA");
    } else {
      logger.i("TOKEN CADUCADO O BANEADO");
    }
  } catch (e) {
    logger.i("AUN NO HAY TOKEN REGISTRADO");
  }

  preferencesBloc
      .firstWhere((state) => state is PreferencesLoaded)
      .then((_) => runApp(MyApp(
            preferencesRepository: preferencesRepository,
            preferencesBloc: preferencesBloc,
            logged: logged,
            authBloc: authBloc,
          )));

  preferencesBloc.add(LoadPreferences());
}
