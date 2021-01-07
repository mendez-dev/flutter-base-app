import 'package:base_app/src/models/user_example/user_example_model.dart';
import 'package:base_app/src/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_paging.g.dart';

abstract class UserPaging implements Built<UserPaging, UserPagingBuilder> {
  // "pages": 1,
  // "current": 1,
  // "users":

  int get pages;
  int get current;
  BuiltList<UserExampleModel> get users;

  UserPaging._();
  factory UserPaging([void Function(UserPagingBuilder) updates]) = _$UserPaging;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserPaging.serializer, this);
  }

  static UserPaging fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserPaging.serializer, json);
  }

  static Serializer<UserPaging> get serializer => _$userPagingSerializer;
}
