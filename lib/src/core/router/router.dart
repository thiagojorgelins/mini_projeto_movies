import 'package:go_router/go_router.dart';
import 'package:mini_projeto_movies/src/features/movies/ui/home_page.dart';
import 'package:mini_projeto_movies/src/features/login/ui/login_page.dart';
import 'package:mini_projeto_movies/src/features/movies/ui/movie_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => FormLogin()),
    GoRoute(path: "/movies", builder: (context, state) => ScreenMovies()),
    GoRoute(
      path: '/movies/:movieId',
      builder: (context, state) {
        final movieId = state.pathParameters['movieId']!;
        return MoviePage(movieId: movieId);
      },
    ),
  ],
);
