import '../../src/repositories/preferences/preferences_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers {
  BuildContext context;
  DateTime currentBackPressTime;

  Helpers.of(this.context);

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Pulse otra vez para salir");
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future<void> sessionExpired() async {
    RepositoryProvider.of<PreferencesRepository>(context).remove("token");
    RepositoryProvider.of<PreferencesRepository>(context).remove("logged");
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  String dateFormat(String date) {
    try {
      List<String> listDate = date.split("-");
      return "${listDate[2]}/${listDate[1]}/${listDate[0]}";
    } catch (e) {
      return "formato de fecha incorrecto";
    }
  }
}
