import 'package:base_app/src/presentation/pages/settings/settings_page.dart';

import '../../presentation/pages/home/home_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
      HomePage(),
);

var settingsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
      SettingsPage(),
);
