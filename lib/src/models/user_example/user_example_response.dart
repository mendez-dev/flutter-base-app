import 'package:base_app/src/models/user_example/user_paging.dart';
import 'package:base_app/src/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_example_response.g.dart';

abstract class UserExampleResponse
    implements Built<UserExampleResponse, UserExampleResponseBuilder> {
  int get code;
  String get message;
  UserPaging get data;

  UserExampleResponse._();
  factory UserExampleResponse(
          [void Function(UserExampleResponseBuilder) updates]) =
      _$UserExampleResponse;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserExampleResponse.serializer, this);
  }

  static UserExampleResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserExampleResponse.serializer, json);
  }

  static Serializer<UserExampleResponse> get serializer =>
      _$userExampleResponseSerializer;
}
