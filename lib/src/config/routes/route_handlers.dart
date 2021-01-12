import 'package:base_app/src/presentation/pages/forms/department_municipality_page.dart';
import 'package:base_app/src/presentation/pages/forms/forms_page.dart';
import 'package:base_app/src/presentation/pages/login/login_page.dart';
import 'package:base_app/src/presentation/pages/refresh/simple_refresh_page.dart';
import 'package:base_app/src/presentation/pages/settings/settings_page.dart';

import '../../presentation/pages/home/home_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
      HomePage(),
);

var loginHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
      LoginPage(),
);

var settingsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
      SettingsPage(),
);

var simpleRefreshHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
      SimpleRefreshPage(),
);

var formsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
      FormsPage(),
);

var departmentMunicipalityHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
      DepartmentMunicipalityPage(),
);
