import 'package:base_app/src/presentation/widgets/forms/validated_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login1Page extends StatelessWidget {
  static final String routeName = "LoginPage";

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "INICIO DE SESIÓN",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                  height: _size.height * 0.4,
                  child: SvgPicture.asset("assets/svgs/login.svg")),
              Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    child: Column(
                  children: [
                    ValidatedInput(
                      keyboardType: TextInputType.emailAddress,
                      label: "Correo",
                      icon: FontAwesomeIcons.at,
                    ),
                    ValidatedInput(
                      label: "Contraseña",
                      icon: FontAwesomeIcons.key,
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
