import 'package:base_app/src/models/address/department_model.dart';
import 'package:base_app/src/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'department_response.g.dart';

abstract class DepartmentResponse
    implements Built<DepartmentResponse, DepartmentResponseBuilder> {
  // "code": 200,
  // "message": "Departamentos de El Salvador",
  // "data"

  int get code;
  String get message;
  BuiltList<DepartmentModel> get data;

  DepartmentResponse._();
  factory DepartmentResponse(
          [void Function(DepartmentResponseBuilder) updates]) =
      _$DepartmentResponse;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(DepartmentResponse.serializer, this);
  }

  static DepartmentResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(DepartmentResponse.serializer, json);
  }

  static Serializer<DepartmentResponse> get serializer =>
      _$departmentResponseSerializer;
}
