import 'package:base_app/src/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'municipality_model.g.dart';

abstract class MunicipalityModel
    implements Built<MunicipalityModel, MunicipalityModelBuilder> {
  //  "id": 47953,
  // "stateId": 53,
  // "name": "Ahuachapán"

  int get id;
  int get stateId;
  String get name;

  MunicipalityModel._();
  factory MunicipalityModel([void Function(MunicipalityModelBuilder) updates]) =
      _$MunicipalityModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(MunicipalityModel.serializer, this);
  }

  static MunicipalityModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(MunicipalityModel.serializer, json);
  }

  static Serializer<MunicipalityModel> get serializer =>
      _$municipalityModelSerializer;
}
