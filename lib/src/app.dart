import 'blocs/auth/auth_bloc.dart';
import 'presentation/pages/login/login_page.dart';
import 'blocs/preferences/preferences_bloc.dart';
import 'config/const.dart';
import 'models/theme/theme_model.dart';
import 'repositories/auth/auth_reporitory_impl.dart';
import 'repositories/network/network_repository.dart';
import 'repositories/preferences/preferences_repository.dart';
import 'presentation/styles/theme_data.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/application.dart';
import 'config/routes/routes.dart';
import 'repositories/auth/auth_repository.dart';

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
                baseUrl: BASE_URL, preferences: preferencesRepository)),
        RepositoryProvider<AuthRepository>(
            create: (BuildContext context) => AuthRepositoryImpl(
                RepositoryProvider.of<NetworkRepository>(context))),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PreferencesBloc>.value(value: preferencesBloc),
          BlocProvider<AuthBloc>(
            create: (BuildContext context) => AuthBloc(
                preferencesRepository:
                    RepositoryProvider.of<PreferencesRepository>(context),
                authRepository: RepositoryProvider.of<AuthRepository>(context)),
          )
        ],
        child: BlocBuilder<PreferencesBloc, PreferencesState>(
            builder: (BuildContext context, PreferencesState state) {
          return MaterialApp(
            theme: state is PreferencesLoaded
                ? themesData[state.theme]
                : themesData[ThemeModel.light],
            title: 'Material App',
            home: LoginPage(),
            onGenerateRoute: Application.router.generator,
          );
        }),
      ),
    );
  }
}
