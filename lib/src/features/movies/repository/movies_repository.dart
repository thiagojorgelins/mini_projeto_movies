import 'package:mini_projeto_movies/src/features/movies/data/adapters/movies_adapter.dart';
import 'package:mini_projeto_movies/src/features/movies/data/datasourcer/movies_datasource.dart';
import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';

class MoviesRepository {
  final MoviesDatasource _moviesDatasource;

  MoviesRepository(this._moviesDatasource);

  Future<Movies> showAllMovies() async {
    try {
      var response = await _moviesDatasource.getAllMovies();
      return MovieAdapter.decodeProto(response);
    }  catch (e) {
      throw Exception('Failed to get movies $e');
    }
  }
}