import '../../../src/models/user/login_model.dart';
import '../../../src/models/user/user_response.dart';

abstract class AuthRepository {
  /// Auth Repository
  ///
  /// Contiene todos los metodos necesarios para hacer la autentificación de
  /// usuarios, haciendo uso de [NetworkRepository] basada en [Dio].
  AuthRepository();

  /// Login
  ///
  /// Realiza una petción [HTTP] al endpoint [login] utilizando el metodo [POST]
  /// y enviando un [json] generado a partir de un objeto [LoginModel] que se
  /// envia como parametro en la variable [login].
  Future<UserResponse> login(LoginModel login);

  /// Verify
  ///
  /// Realiza una petición [HTTP] al endpoint [verify] utilizando el metodo [GET]
  /// el cual verifica el token de acceso enviado y si es correcto retorna la
  /// información del usuario
  Future<UserResponse> verify();
}
