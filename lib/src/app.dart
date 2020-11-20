import 'package:base_app/src/blocs/preferences/preferences_bloc.dart';
import 'package:base_app/src/helpers/const.dart';
import 'package:base_app/src/models/theme/theme_model.dart';
import 'package:base_app/src/presentation/pages/home_page.dart';
import 'package:base_app/src/presentation/pages/logins/login_1_page.dart';
import 'package:base_app/src/presentation/pages/logins_page.dart';
import 'package:base_app/src/repositories/network/network_repository.dart';
import 'package:base_app/src/repositories/preferences/preferences_repository.dart';
import 'package:base_app/src/presentation/styles/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/pages/settings_page.dart';

class MyApp extends StatelessWidget {
  final PreferencesRepository preferencesRepository;
  final PreferencesBloc preferencesBloc;

  const MyApp(
      {Key key,
      @required this.preferencesRepository,
      @required this.preferencesBloc})
      : super(key: key);

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
                : themesData[ThemeModel.dark],
            title: 'Material App',
            initialRoute: HomePage.routeName,
            routes: {
              HomePage.routeName: (BuildContext context) => HomePage(),
              SettingsPage.routeName: (BuildContext context) => SettingsPage(),
              LoginsPage.routeName: (BuildContext context) => LoginsPage(),
              Login1Page.routeName: (BuildContext context) => Login1Page(),
            },
          );
        }),
      ),
    );
  }
}
