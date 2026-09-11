import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto_movies/src/core/di/injection.dart';
import 'package:mini_projeto_movies/src/features/login/controller/login_controller.dart';
import 'package:mini_projeto_movies/src/features/login/ui/widgets/custom_text_field.dart';

class FormLogin extends StatefulWidget {
  const new({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _loginController = getIt<LoginController>();

  void doLogin(String username, String password) async {
    var success = await _loginController.login(username, password);
    
    if (success) {
      if (mounted){
        context.go('/movies', extra: _loginController.userUsername);
      }
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/image.png'),
            repeat: ImageRepeat.repeat,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(199, 132, 14, 100),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 400,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        CustomTextField(
                          label: "Username",
                          controller: _usernameController,
                          isPassword: false,
                        ),
                        CustomTextField(
                          label: "Password",
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        Column(
                          spacing: 32,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () => {},
                                  child: Text(
                                    "Esqueceu a senha?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(
                                      EdgeInsets.symmetric(
                                        horizontal: 72,
                                        vertical: 16,
                                      ),
                                    ),
                                  ),
                                  onPressed: () => {
                                    doLogin(_usernameController.text, _passwordController.text),
                                  },
                                  child: Text("Entrar"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
