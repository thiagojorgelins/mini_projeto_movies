import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto_movies/src/core/di/injection.dart';
import 'package:mini_projeto_movies/src/features/movies/controller/available_movies_controller.dart';
import 'package:mini_projeto_movies/src/features/movies/controller/rental_movies_controller.dart';
import 'package:mini_projeto_movies/src/features/movies/ui/widgets/grid_movies.dart';
import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';
import 'package:signals/signals_flutter.dart';

class AvailableMovies extends StatefulWidget {
  const new({super.key});

  @override
  State<AvailableMovies> createState() => _AvailableMoviesState();
}

class _AvailableMoviesState extends State<AvailableMovies> {
  final _moviesController = getIt<AvailableMoviesController>();
  final _rentalController = getIt<RentalMoviesController>();

  @override
  void initState() {
    super.initState();
    _moviesController.getAvailableMovies();
  }

  void goToMovieScreen(Movie movie) {
    if (mounted) {
      _rentalController.setMovieById = movie;
      context.go("/movies/:${movie.id}", extra: "screenAllMovies");
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
          builder: (context) => GridMovies(
            onLongPress: () => {},
            onTap: (movies) => goToMovieScreen(movies),
            movies: _moviesController.movies,
          ),
        ),
      ),
    );
  }
}
