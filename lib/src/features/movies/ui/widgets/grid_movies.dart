import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';

class GridMovies extends StatefulWidget {
  final void Function(Movie movies)? onTap;
  final void Function()? onLongPress;
  final List<Movie> movies;

  const GridMovies({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.movies,
  });

  @override
  State<GridMovies> createState() => _GridMoviesState();
}

class _GridMoviesState extends State<GridMovies> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(32),
      itemCount: widget.movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4
      ),
      itemBuilder: (_, int index) {
        final movie = widget.movies[index];
        return InkWell(
          onTap: () => widget.onTap?.call(movie),
          onLongPress: () => widget.onLongPress?.call(),
          customBorder: Border.all(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8.0)),
              child: GridTile(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
