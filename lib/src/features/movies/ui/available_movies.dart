import 'package:flutter/material.dart';
import 'package:mini_projeto_movies/src/core/di/injection.dart';
import 'package:mini_projeto_movies/src/features/movies/controller/movies_controller.dart';
import 'package:mini_projeto_movies/src/features/movies/ui/widgets/grid_movies.dart';
import 'package:signals/signals_flutter.dart';

class AvailableMovies extends StatefulWidget {
  const new({super.key});

  @override
  State<AvailableMovies> createState() => _AvailableMoviesState();
}

class _AvailableMoviesState extends State<AvailableMovies> {
  final _moviesController = getIt<MoviesController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SignalBuilder(
          builder: (context) {
            return GridMovies(
              onLongPress: () => {},
              onTap: (movies) => {},
              movies: _moviesController.movies,
            );
          },
        ),
      ),
    );
  }
}
