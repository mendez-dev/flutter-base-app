import '../../../src/models/user/login_model.dart';
import '../../../src/models/user/user_response.dart';

abstract class AuthRepository {
  Future<UserResponse> login(LoginModel login);
  Future<UserResponse> verify();
}
