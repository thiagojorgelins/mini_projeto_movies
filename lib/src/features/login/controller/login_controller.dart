import 'package:mini_projeto_movies/src/features/login/repository/login_repository.dart';
import 'package:signals/signals_core.dart';

class LoginController {
  final LoginRepository loginRepository;
  LoginController(this.loginRepository);
  var errorMessage = signal<String?>(null);

  var userId = signal<int>(0);
  var userUsername = signal<String>('');

  Future<bool> login(String username, String password) async {
    try {
      final loginUser = await loginRepository.login(username, password);
      if (!loginUser.id.isNaN) {
        userId.value = loginUser.id;
        userUsername.value = loginUser.username;
        return true;
      }
      return false;
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    }
  }
}
