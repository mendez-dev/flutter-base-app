import 'package:base_app/src/helpers/helper.dart';
import 'package:base_app/src/presentation/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalogo"),
          actions: [
            IconButton(
                icon: Icon(FontAwesomeIcons.slidersH),
                onPressed: () => Navigator.pushNamed(context, '/settings'))
          ],
        ),
        body: WillPopScope(
          onWillPop: Helpers.of(context).onWillPop,
          child: SingleChildScrollView(child: Container()),
        ));
  }
}
