import 'package:base_app/src/repositories/data/data_repository.dart';
import 'package:base_app/src/repositories/data/data_repository_impl.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/users/users_bloc.dart';
import 'presentation/pages/home/home_page.dart';
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
  final AuthBloc authBloc;
  final bool logged;

  MyApp(
      {Key key,
      @required this.preferencesRepository,
      @required this.preferencesBloc,
      @required this.authBloc,
      @required this.logged}) {
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
        RepositoryProvider<DataRepository>(
            create: (BuildContext context) => DataReporitoyImpl(
                networkRepository:
                    RepositoryProvider.of<NetworkRepository>(context)))
        // RepositoryProvider(create: (BuildContext context) => )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PreferencesBloc>.value(value: preferencesBloc),
          BlocProvider<AuthBloc>.value(value: authBloc),
          BlocProvider<UsersBloc>(
              create: (BuildContext context) => UsersBloc(
                  dataRepository:
                      RepositoryProvider.of<DataRepository>(context))),
        ],
        child: BlocBuilder<PreferencesBloc, PreferencesState>(
            builder: (BuildContext context, PreferencesState state) {
          return MaterialApp(
            theme: state is PreferencesLoaded
                ? themesData[state.theme]
                : themesData[ThemeModel.light],
            title: 'Material App',
            home: logged ? HomePage() : LoginPage(),
            onGenerateRoute: Application.router.generator,
          );
        }),
      ),
    );
  }
}
