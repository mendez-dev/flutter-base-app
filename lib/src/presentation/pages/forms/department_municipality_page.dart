import 'package:base_app/src/presentation/widgets/forms/department_municipality_select_widget.dart';
import 'package:flutter/material.dart';

class DepartmentMunicipalityPage extends StatelessWidget {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Departamento y Municipio"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Form(
                  key: form,
                  child: Column(
                    children: [
                      DepartmentMunicipalitySelectWidget(
                        onDepartmentSelect: (int id) => print(id),
                        onMunicipalitySelect: (int id) => print(id),
                      )
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: FlatButton(
                    textColor: Colors.white,
                    onPressed: () {
                      if (!form.currentState.validate()) {}
                    },
                    child: Text("VALIDAR")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
