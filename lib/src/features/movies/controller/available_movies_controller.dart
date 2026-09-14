import 'package:mini_projeto_movies/src/features/movies/repository/movies_repository.dart';
import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';
import 'package:signals/signals_hooks.dart';

class AvailableMoviesController {
    final MoviesRepository _moviesRepository;
    final _listMovies = listSignal<Movie>([]);

    List<Movie> get movies => _listMovies.value;

    AvailableMoviesController(this._moviesRepository);

    void getAvailableMovies() async {
    try {
      final response = await _moviesRepository.showAllMovies();
      final List<Movie> allMovies = response.movies;
      if (_listMovies.isEmpty) {
        _listMovies.value = allMovies;
      }
    } catch (e) {
      throw Exception("Failed to load movies ${e.toString()}");
    }
  }
}