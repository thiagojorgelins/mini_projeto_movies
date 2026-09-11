import 'package:mini_projeto_movies/src/features/movies/repository/movies_repository.dart';
import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';
import 'package:signals/signals.dart';

class MoviesController {
  final MoviesRepository _moviesRepository;
  final _listMovies = listSignal<Movie>([]);
  final _listUserMovies = listSignal<Movie>([]);
  final _movieById = signal<Movie>(Movie());

  List<Movie> get movies => _listMovies.value;
  List<Movie> get userMovies => _listUserMovies.value;
  Signal<Movie> get movieById => _movieById;

  set setMovieById(Movie movie) {
    _movieById.value = movie;
  }

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

  Future<bool> rentalMovies(int userId, int movieId) async {
    try {
      final response = await _moviesRepository.rentalMovie(userId, movieId);
      return response;
    } catch (e) {
      throw Exception("Failed to rental movie");
    }
  }

  Future<bool> watchMovies(int userId, int movieId) async {
    try {
      final response = await _moviesRepository.watchMovie(userId, movieId);
      return response;
    } catch (e) {
      throw Exception("Failed to rental movie");
    }
  }

  void rentalMoviesByUser(int userId) async {
    try {
      final response = await _moviesRepository.showRentalMoviesByUser(userId);
      _listUserMovies.value = response.movies;
    } catch (e) {
      throw Exception("Failed to load movies from user: ${e.toString()}");
    }
  }
}
