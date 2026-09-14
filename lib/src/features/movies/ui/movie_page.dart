import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto_movies/src/core/di/injection.dart';
import 'package:mini_projeto_movies/src/core/router/router.dart';
import 'package:mini_projeto_movies/src/features/login/controller/login_controller.dart';
import 'package:mini_projeto_movies/src/features/movies/controller/rental_movies_controller.dart';

class MoviePage extends StatefulWidget {
  final String movieId;
  const new({super.key, required this.movieId});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final _moviesController = getIt<RentalMoviesController>();
  final _loginController = getIt<LoginController>();

  Future<void> rentMovie() async {
    final res = await _moviesController.rentalMovies(
      _loginController.userId.value,
      _moviesController.movieById.value.id,
    );
    if (res) {
      context.go("/movies");
    }
  }

  Future<void> watchMovie() async {
    final res = _moviesController.watchMovies(
      _loginController.userId.value,
      _moviesController.movieById.value.id,
    );
    if (await res) {
      context.go("/movies");
    }
  }

  @override
  Widget build(BuildContext context) {
    final movie = _moviesController.movieById.value;
    bool fromScreen = router.state.extra == "screenAllMovies";

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
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 540,
                              width: 848,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        movie.title,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        movie.sinopse,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        spacing: 16,
                                        children: [
                                          Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Year",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  movie.year,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Director",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  movie.director,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        spacing: 16,
                                        children: [
                                          fromScreen == true
                                              ? Row(
                                                  spacing: 16,
                                                  children: [
                                                    OutlinedButton(
                                                      onPressed: () =>
                                                          context.go("/movies"),
                                                      child: Text("Cancel"),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: rentMovie,
                                                      child: Text("Rental"),
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  spacing: 16,
                                                  children: [
                                                    OutlinedButton(
                                                      onPressed: () =>
                                                          context.go("/movies"),
                                                      child: Text("Cancel"),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: watchMovie,
                                                      child: Text("Watch"),
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
