import 'package:base_app/src/models/user/user_model.dart';
import 'package:base_app/src/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_response.g.dart';

abstract class UserResponse
    implements Built<UserResponse, UserResponseBuilder> {
  int get code;
  String get message;
  @nullable
  UserModel get data;

  UserResponse._();
  factory UserResponse([void Function(UserResponseBuilder) updates]) =
      _$UserResponse;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserResponse.serializer, this);
  }

  static UserResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserResponse.serializer, json);
  }

  static Serializer<UserResponse> get serializer => _$userResponseSerializer;
}
