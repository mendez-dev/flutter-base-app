import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginsPage extends StatelessWidget {
  static final String routeName = "LoginPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pantallas de login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("Login 1"),
              trailing: Icon(FontAwesomeIcons.chevronRight),
            )
          ],
        ),
      ),
    );
  }
}
