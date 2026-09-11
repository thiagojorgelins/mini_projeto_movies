import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto_movies/src/core/di/injection.dart';
import 'package:mini_projeto_movies/src/features/login/controller/login_controller.dart';
import 'package:mini_projeto_movies/src/features/movies/controller/movies_controller.dart';
import 'package:mini_projeto_movies/src/features/movies/ui/widgets/grid_movies.dart';
import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';
import 'package:signals/signals_flutter.dart';

class RentalMovies extends StatefulWidget {
  const new({super.key});

  @override
  State<RentalMovies> createState() => _RentalMoviesState();
}

class _RentalMoviesState extends State<RentalMovies> {
  final _moviesController = getIt<MoviesController>();
  final _loginController = getIt<LoginController>();

  @override
  void initState() {
    super.initState();
    _moviesController.rentalMoviesByUser(_loginController.userId.value);
  }

  void goToMovieScreen(Movie movie) {
    if (mounted) {
      _moviesController.setMovieById = movie;
      context.go("/movies/:${movie.id}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 76, 5, 47),
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SignalBuilder(
          builder: (context) {
            return GridMovies(
              onLongPress: () => {},
              onTap: (movies) => goToMovieScreen(movies),
              movies: _moviesController.userMovies,
            );
          },
        ),
      ),
    );
  }
}
