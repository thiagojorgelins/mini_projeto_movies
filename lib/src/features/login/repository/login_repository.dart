import 'package:mini_projeto_movies/src/features/login/data/adapters/login_adapter.dart';
import 'package:mini_projeto_movies/src/features/login/data/datasources/login_datasource.dart';
import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';

class LoginRepository {
  final LoginDatasource _loginDatasource;

  LoginRepository(this._loginDatasource);

  Future<User> login(String username, String password) async {
    try {
      var loginUser = UserAdapter.encodedUser(
        User(id: 0, username: username, password: password),
      );
      var response = await _loginDatasource.login(loginUser);
      var userDecoded = UserAdapter.decodeUser(response);
      return userDecoded;
    } catch (e) {
      throw Exception('Failed to login: ${e.toString()}');
    }
  }
  
}
