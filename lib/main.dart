import 'package:base_app/src/blocs/preferences/preferences_bloc.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/repositories/preferences/preferences_repository_impl.dart';

void main() async {
  // Se llama este metodo cuando se necesita ejecutar codigo nntes de llamar el
  // primer widget
  WidgetsFlutterBinding.ensureInitialized();

  final preferencesRepository = PreferencesRepositoryImpl();
  // ignore: close_sinks
  final preferencesBloc =
      PreferencesBloc(preferencesRepository: preferencesRepository);

  preferencesBloc
      .firstWhere((state) => state is PreferencesLoaded)
      .then((_) => runApp(MyApp(
            preferencesRepository: preferencesRepository,
            preferencesBloc: preferencesBloc,
          )));

  preferencesBloc.add(LoadPreferences());
}
