import 'package:go_router/go_router.dart';
import 'package:mini_projeto_movies/src/features/movies/ui/movies_page.dart';
import 'package:mini_projeto_movies/src/features/login/ui/login_page.dart';


final router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => FormLogin()),
    GoRoute(path: "/movies", builder: (context, state) => ScreenMovies()),
  ],
);
