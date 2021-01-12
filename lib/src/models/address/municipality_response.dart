import 'package:base_app/src/models/address/municipality_model.dart';
import 'package:base_app/src/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'municipality_response.g.dart';

abstract class MunicipalityResponse
    implements Built<MunicipalityResponse, MunicipalityResponseBuilder> {
  // "code": 200,
  // "message": "Municipios",
  // "data":
  int get code;
  String get message;
  BuiltList<MunicipalityModel> get data;

  MunicipalityResponse._();
  factory MunicipalityResponse(
          [void Function(MunicipalityResponseBuilder) updates]) =
      _$MunicipalityResponse;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MunicipalityResponse.serializer, this);
  }

  static MunicipalityResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MunicipalityResponse.serializer, json);
  }

  static Serializer<MunicipalityResponse> get serializer =>
      _$municipalityResponseSerializer;
}
