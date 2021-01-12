import 'package:base_app/src/models/address/department_model.dart';
import 'package:base_app/src/models/address/department_response.dart';
import 'package:base_app/src/models/address/municipality_model.dart';
import 'package:base_app/src/models/address/municipality_response.dart';
import 'package:base_app/src/models/theme/theme_model.dart';
import 'package:base_app/src/models/user/login_model.dart';
import 'package:base_app/src/models/user/user_model.dart';
import 'package:base_app/src/models/user/user_response.dart';
import 'package:base_app/src/models/user_example/user_example_model.dart';
import 'package:base_app/src/models/user_example/user_example_response.dart';
import 'package:base_app/src/models/user_example/user_paging.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor([
  ThemeModel,
  UserModel,
  UserResponse,
  LoginModel,
  UserExampleModel,
  UserPaging,
  UserExampleResponse,
  DepartmentResponse,
  DepartmentModel,
  MunicipalityResponse,
  MunicipalityModel
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
