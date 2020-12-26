import 'package:base_app/src/blocs/preferences/preferences_bloc.dart';
import 'package:base_app/src/helpers/const.dart';
import 'package:base_app/src/models/theme/theme_model.dart';
import 'package:base_app/src/presentation/pages/home/home_page.dart';
import 'package:base_app/src/repositories/network/network_repository.dart';
import 'package:base_app/src/repositories/preferences/preferences_repository.dart';
import 'package:base_app/src/presentation/styles/theme_data.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/application.dart';
import 'config/routes/routes.dart';

class MyApp extends StatelessWidget {
  final PreferencesRepository preferencesRepository;
  final PreferencesBloc preferencesBloc;

  MyApp(
      {Key key,
      @required this.preferencesRepository,
      @required this.preferencesBloc}) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PreferencesRepository>.value(
            value: preferencesRepository),
        RepositoryProvider<NetworkRepository>(
            create: (BuildContext context) => NetworkRepository(
                baseUrl: BASE_URL, preferences: preferencesRepository))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PreferencesBloc>.value(value: preferencesBloc)
        ],
        child: BlocBuilder<PreferencesBloc, PreferencesState>(
            builder: (BuildContext context, PreferencesState state) {
          return MaterialApp(
            theme: state is PreferencesLoaded
                ? themesData[state.theme]
                : themesData[ThemeModel.light],
            title: 'Material App',
            home: HomePage(),
            onGenerateRoute: Application.router.generator,
          );
        }),
      ),
    );
  }
}
