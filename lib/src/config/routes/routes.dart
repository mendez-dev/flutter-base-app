/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import '../../../src/config/routes/route_handlers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = "/";
  static String login = "/login";
  static String home = "/home";
  static String settings = "/settings";
  static String simpleRefresh = "/simplerefresh";
  static String forms = '/forms';
  static String depMun = '/forms/depMun';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    // router.define(login, handler: loginHandler);
    router.define(login, handler: loginHandler);
    router.define(home, handler: homeHandler);
    router.define(settings, handler: settingsHandler);
    router.define(simpleRefresh, handler: simpleRefreshHandler);
    router.define(forms, handler: formsHandler);
    router.define(depMun, handler: departmentMunicipalityHandler);
  }
}
