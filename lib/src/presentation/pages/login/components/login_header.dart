import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login_clipers.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper2(),
          child: Container(
            child: Column(),
            width: double.infinity,
            height: 320,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.indigo[200], Colors.indigo[100]])),
          ),
        ),
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            child: Column(),
            width: double.infinity,
            height: 320,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.indigo[300], Colors.indigo[200]])),
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Icon(
                  FontAwesomeIcons.signInAlt,
                  color: Colors.white,
                  size: 60,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "INICIO DE SESIÓN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 27),
                ),
              ],
            ),
            width: double.infinity,
            height: 320,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor,
            ])),
          ),
        ),
      ],
    );
  }
}
