import '../../../src/models/user/login_model.dart';
import '../../../src/models/user/user_response.dart';
import '../../../src/repositories/network/network_repository.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Auth Repository
  ///
  /// Contiene todos los metodos necesarios para hacer la autentificación de
  /// usuarios, haciendo uso de [NetworkRepository] basada en [Dio].
  AuthRepositoryImpl(NetworkRepository networkRepository)
      : this._networkRepository = networkRepository;

  final NetworkRepository _networkRepository;

  @override
  Future<UserResponse> login(LoginModel login) async {
    final response =
        await _networkRepository.instance.post('/login', data: login.toJson());
    return UserResponse.fromJson(response.data);
  }

  @override
  Future<UserResponse> verify() async {
    final response = await _networkRepository.instance.get('/verify');
    return UserResponse.fromJson(response.data);
  }
}
