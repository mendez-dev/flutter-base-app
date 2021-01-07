import 'package:base_app/src/models/user_example/user_example_response.dart';
import 'package:base_app/src/repositories/data/data_repository.dart';
import 'package:base_app/src/repositories/network/network_repository.dart';

class DataReporitoyImpl implements DataRepository {
  final NetworkRepository _networkRepository;

  DataReporitoyImpl({NetworkRepository networkRepository})
      : this._networkRepository = networkRepository;

  @override
  Future<UserExampleResponse> getUsers({int page, int registers}) async {
    final response =
        await _networkRepository.instance.get("/test/users/$page/$registers");
    return UserExampleResponse.fromJson(response.data);
  }
}
