import 'package:mini_projeto_movies/src/features/movies/repository/movies_repository.dart';
import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';
import 'package:signals/signals.dart';

class MoviesController {
  final MoviesRepository _moviesRepository;
  final _listMovies = listSignal<Movie>([]);

  List<Movie> get movies => _listMovies.value;

  MoviesController(this._moviesRepository);

  void getAvailableMovies() async {
    try {
      final response = await _moviesRepository.showAllMovies();
      final List<Movie> allMovies = response.movies;
      if (allMovies.isNotEmpty) {
        _listMovies.value = allMovies;
      }
    } catch (e) {
      throw Exception("Failed to load movies ${e.toString()}");
    }
  }

  void rentalMoviesByUser(int userId, int movieId){
    try {

    } catch (e) {
      throw Exception("Failed to load movies from user: ${e.toString()}");
    }
  }
}
