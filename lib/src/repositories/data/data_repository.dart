import 'package:base_app/src/models/user_example/user_example_response.dart';

/// Clase abstracta que define los metodos a implementar en el [AuthRepository]
abstract class DataRepository {
  Future<UserExampleResponse> getUsers({int page, int registers});
}
