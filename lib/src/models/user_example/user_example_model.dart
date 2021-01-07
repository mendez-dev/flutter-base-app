import 'package:base_app/src/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_example_model.g.dart';

abstract class UserExampleModel
    implements Built<UserExampleModel, UserExampleModelBuilder> {
  int get id;
  String get name;
  String get address;

  UserExampleModel._();
  factory UserExampleModel([void Function(UserExampleModelBuilder) updates]) =
      _$UserExampleModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserExampleModel.serializer, this);
  }

  static UserExampleModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserExampleModel.serializer, json);
  }

  static Serializer<UserExampleModel> get serializer =>
      _$userExampleModelSerializer;
}
