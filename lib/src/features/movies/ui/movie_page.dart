import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto_movies/src/core/di/injection.dart';
import 'package:mini_projeto_movies/src/features/login/controller/login_controller.dart';
import 'package:mini_projeto_movies/src/features/movies/controller/movies_controller.dart';

class MoviePage extends StatefulWidget {
  final String movieId;
  const new({super.key, required this.movieId});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final _moviesController = getIt<MoviesController>();
  final _loginController = getIt<LoginController>();

  Future<void> rentMovie() async {
    final res = _moviesController.rentalMovies(
      _loginController.userId.value,
      _moviesController.movieById.value.id,
    );
    if (await res) {
      context.go("/movies");
      print("filme alugado");
    }
  }

  Future<void> watchMovie() async {
    final res = _moviesController.watchMovies(
      _loginController.userId.value,
      _moviesController.movieById.value.id,
    );
    if (await res) {
      context.go("/movies");

      print("filme assistido");
    }
  }

  @override
  Widget build(BuildContext context) {
    final movie = _moviesController.movieById.value;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 5, 47),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 115, 0, 135),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => {context.go("/movies")},
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ],
        ),
      ),
      //#280032
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Image.memory(
                        Uint8List.fromList(movie.cover),
                        fit: BoxFit.cover,
                        scale: 0.5,
                      ),
                    ),
                    Text(
                      "R\$ ${movie.value.toStringAsFixed(2)}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed: watchMovie, child: Text("Watch")),
                    ElevatedButton(onPressed: rentMovie, child: Text("Rental")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
