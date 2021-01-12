import 'package:base_app/src/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'department_model.g.dart';

abstract class DepartmentModel
    implements Built<DepartmentModel, DepartmentModelBuilder> {
  // "id": 53,
  // "name": "Ahuachapán",

  int get id;
  String get name;

  DepartmentModel._();
  factory DepartmentModel([void Function(DepartmentModelBuilder) updates]) =
      _$DepartmentModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(DepartmentModel.serializer, this);
  }

  static DepartmentModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(DepartmentModel.serializer, json);
  }

  static Serializer<DepartmentModel> get serializer =>
      _$departmentModelSerializer;
}
