import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers {
  BuildContext context;
  DateTime currentBackPressTime;

  Helpers.of(BuildContext _context) {
    this.context = _context;
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Salir");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
