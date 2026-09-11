import 'package:flutter_dotenv/flutter_dotenv.dart';

final address = dotenv.get('ADDRESS');
final port = dotenv.get('PORT'); 
final userToken = dotenv.get('TOKEN');

final doLogin = "$address:$port/login";
final getAvailableMovies = "$address:$port/available-movies";
final rentalMovies = "$address:$port/rental-movie";
final rentalMoviesByUser = "$address:$port/movies-rental-by-user";
final watchMovie = "$address:$port/watch-movie";