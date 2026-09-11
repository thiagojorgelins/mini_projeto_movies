import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mini_projeto_movies/src/features/login/controller/login_controller.dart';
import 'package:mini_projeto_movies/src/features/login/data/datasources/login_datasource.dart';
import 'package:mini_projeto_movies/src/features/login/repository/login_repository.dart';
import 'package:mini_projeto_movies/src/features/movies/controller/movies_controller.dart';
import 'package:mini_projeto_movies/src/features/movies/data/datasourcer/movies_datasource.dart';
import 'package:mini_projeto_movies/src/features/movies/repository/movies_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory(() => http.Client());

  getIt.registerFactory<LoginDatasource>(() => LoginDatasource());
  getIt.registerFactory<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerLazySingleton(() => LoginController(getIt()));

  getIt.registerFactory<MoviesDatasource>(() => MoviesDatasource());
  getIt.registerFactory<MoviesRepository>(() => MoviesRepository(getIt()));
  getIt.registerLazySingleton(() => MoviesController(getIt()));
}
