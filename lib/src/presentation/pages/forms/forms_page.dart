import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formularios"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () => Navigator.pushNamed(context, "/forms/depMun"),
              leading: Icon(FontAwesomeIcons.globeAmericas),
              trailing: Icon(FontAwesomeIcons.chevronRight),
              title: Text("Departamento y Municipio"),
              subtitle: Text(
                  "Permite seleccionar departamentos y municipio mediante selects relacionados"),
            )
          ],
        ),
      ),
    );
  }
}
