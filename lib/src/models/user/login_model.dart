import 'package:base_app/src/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'login_model.g.dart';

abstract class LoginModel implements Built<LoginModel, LoginModelBuilder> {
  String get user;
  String get password;
  @BuiltValueField(wireName: 'token')
  String get fcmToken;

  LoginModel._();
  factory LoginModel([void Function(LoginModelBuilder) updates]) = _$LoginModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LoginModel.serializer, this);
  }

  static LoginModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(LoginModel.serializer, json);
  }

  static Serializer<LoginModel> get serializer => _$loginModelSerializer;
}
