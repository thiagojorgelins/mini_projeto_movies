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
      itemCount: widget.movies.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),
      itemBuilder: (_, int index) {
        final movie = widget.movies[index];

        return InkWell(
          onTap: () => widget.onTap?.call(movie),
          onLongPress: () => widget.onLongPress?.call(),
          child: GridTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.memory(
                  Uint8List.fromList(movie.cover),
                  fit: BoxFit.cover,
                  scale: 0.5,
                ),
                Text("R\$ ${movie.value.toStringAsFixed(2)}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
