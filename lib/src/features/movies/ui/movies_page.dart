import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto_movies/src/core/di/injection.dart';
import 'package:mini_projeto_movies/src/core/router/router.dart';
import 'package:mini_projeto_movies/src/features/movies/controller/movies_controller.dart';
import 'package:mini_projeto_movies/src/features/movies/ui/available_movies.dart';
import 'package:mini_projeto_movies/src/features/movies/ui/rental_movies.dart';


class ScreenMovies extends StatefulWidget {
  const new({super.key});

  @override
  State<ScreenMovies> createState() => _ScreenMoviesState();
}

class _ScreenMoviesState extends State<ScreenMovies> {
  final _moviesController = getIt<MoviesController>();
  var data = router.state.extra;

  @override
  void initState(){
    super.initState();
    _moviesController.getAvailableMovies();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 115, 0, 135),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 12,
                children: [
                  Icon(Icons.circle, color: Colors.white, size: 40),
                  Text(
                    "${data.toString().isEmpty ? 'Username' : data}",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              IconButton(
                onPressed: () => {context.go("/")},
                icon: Icon(Icons.exit_to_app, color: Colors.white),
              ),
            ],
          ),
          bottom: TabBar(
            unselectedLabelColor: Colors.white,
            labelStyle: TextStyle(color: Colors.white),
            tabs: <Widget>[
              Tab(text: "Available movies"),
              Tab(text: 'Movies rental'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            AvailableMovies(),
            RentalMovies(),
          ],
        ),
      ),
    );
  }
}
