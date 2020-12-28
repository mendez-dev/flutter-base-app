import 'package:base_app/src/utils/logger.dart';

import '../../../src/models/user/login_model.dart';
import '../../../src/models/user/user_response.dart';
import '../../../src/repositories/network/network_repository.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkRepository _networkRepository;

  AuthRepositoryImpl(NetworkRepository networkRepository)
      : this._networkRepository = networkRepository;

  @override
  Future<UserResponse> login(LoginModel login) async {
    final response =
        await _networkRepository.instance.post('/login', data: login.toJson());
    logger.e(response);
    return UserResponse.fromJson(response.data);
  }

  @override
  Future<UserResponse> verify() async {
    final response = await _networkRepository.instance.get('/verify');
    return UserResponse.fromJson(response.data);
  }
}
