import 'package:mini_projeto_movies/src/features/login/data/adapters/login_adapter.dart';
import 'package:mini_projeto_movies/src/features/movies/data/adapters/movies_adapter.dart';
import 'package:mini_projeto_movies/src/features/movies/data/datasourcer/movies_datasource.dart';
import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';

class MoviesRepository {
  final MoviesDatasource _moviesDatasource;

  MoviesRepository(this._moviesDatasource);

  Future<Movies> showAllMovies() async {
    try {
      var response = await _moviesDatasource.getAllMovies();
      return MovieAdapter.decodeMovie(response);
    } catch (e) {
      throw Exception('Failed to get movies $e');
    }
  }

  Future<bool> rentalMovie(int userId, int movieId) async {
    try {
      var rentalEncoded = MovieAdapter.encodedRental(
        Rental(userId: userId, movieId: movieId),
      );
      var response = await _moviesDatasource.rentMovie(rentalEncoded);
      return response;
    } catch (e) {
      throw Exception('Failed to load rental movies from user');
    }
  }

  Future<Movies> showRentalMoviesByUser(int userId) async {
    try {
      var userEncoded = UserAdapter.encodedUser(
        User(id: userId, username: "", password: ""),
      );
      var response = await _moviesDatasource.showAllMoviesRentByUser(
        userEncoded,
      );
      return MovieAdapter.decodeMovie(response);
    } catch (e) {
      throw Exception('Failed to load rental movies from user');
    }
  }

  Future<bool> watchMovie(int userId, int movieId) async {
    try {
      var rentalEncoded = MovieAdapter.encodedRental(
        Rental(userId: userId, movieId: movieId),
      );
      var response = await _moviesDatasource.returnMovie(rentalEncoded);
      return response;
    } catch (e) {
      throw Exception('Failed to watch movie');
    }
  }
}
