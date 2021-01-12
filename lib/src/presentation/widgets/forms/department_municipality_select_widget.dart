import 'package:base_app/src/config/const.dart';
import 'package:base_app/src/models/address/department_model.dart';
import 'package:base_app/src/models/address/department_response.dart';
import 'package:base_app/src/models/address/municipality_model.dart';
import 'package:base_app/src/models/address/municipality_response.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DepartmentMunicipalitySelectWidget extends StatefulWidget {
  const DepartmentMunicipalitySelectWidget({
    this.separation = 15,
    this.showIcons = false,
    this.departmentIcon = FontAwesomeIcons.globeAmericas,
    this.municipalityIcon = FontAwesomeIcons.globeAmericas,
    this.onDepartmentSelect,
    this.onMunicipalitySelect,
  });

  final bool showIcons;
  final IconData departmentIcon;
  final IconData municipalityIcon;
  final double separation;
  final void Function(int departmentID) onDepartmentSelect;
  final void Function(int municipalityId) onMunicipalitySelect;

  @override
  _DepartmentMunicipalitySelectWidgetState createState() =>
      _DepartmentMunicipalitySelectWidgetState();
}

class _DepartmentMunicipalitySelectWidgetState
    extends State<DepartmentMunicipalitySelectWidget> {
  int departmentId = 0;
  int municipalityId = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (widget.showIcons) ...[
              Icon(
                widget.departmentIcon,
                color: Color(0xff8b898a),
              ),
              SizedBox(
                width: 17,
              ),
            ],
            Expanded(
              child: DropdownSearch<DepartmentModel>(
                validator: (DepartmentModel department) {
                  if (department == null) {
                    return "Seleccione un departamento";
                  } else {
                    return null;
                  }
                },
                label: "Departamento",
                showSearchBox: true,
                itemAsString: (DepartmentModel department) {
                  return department.name;
                },
                onFind: (String filter) async {
                  var response = await Dio().get(
                    "$BASE_URL/departments",
                  );

                  var models = DepartmentResponse.fromJson(response.data);
                  return models.data.toList();
                },
                onChanged: (DepartmentModel data) {
                  departmentId = data.id;
                  if (widget.onDepartmentSelect != null) {
                    widget.onDepartmentSelect(data.id);
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: widget.separation,
        ),
        Row(
          children: [
            if (widget.showIcons) ...[
              Icon(
                widget.municipalityIcon,
                color: Color(0xff8b898a),
              ),
              SizedBox(
                width: 17,
              ),
            ],
            Expanded(
              child: DropdownSearch<MunicipalityModel>(
                validator: (MunicipalityModel municipality) {
                  if (municipality == null) {
                    return "Seleccione un municipio";
                  } else if (municipality.stateId != departmentId) {
                    return "El municipio no corresponde al departamento";
                  } else {
                    return null;
                  }
                },
                label: "Municipio",
                showSearchBox: true,
                itemAsString: (MunicipalityModel department) {
                  return department.name;
                },
                onFind: (String filter) async {
                  var response =
                      await Dio().get("$BASE_URL/municipalities/$departmentId");

                  var models = MunicipalityResponse.fromJson(response.data);
                  return models.data.toList();
                },
                onChanged: (MunicipalityModel data) {
                  if (widget.onMunicipalitySelect != null) {
                    widget.onMunicipalitySelect(data.id);
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
