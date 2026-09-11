import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:mini_projeto_movies/src/core/networks/server.address.dart';
import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';

class MoviesDatasource {
  final client = http.Client();

  Future<Uint8List> getAllMovies() async {
    try {
      final response = await client.get(Uri.parse(getAvailableMovies));
      return response.bodyBytes;
    } catch (e) {
      throw Exception('Can\'t connect to server! ${e.toString()}');
    }
  }

  Future<bool> rentMovie(int userId, int movieId) async {
    try {
      Rental rental = Rental(userId: userId, movieId: movieId);
      final response = await client.post(
        Uri.parse(rentalMovies),
        headers: {
          'Content-Type': 'application/x-protobuf',
          'X-Student-Token': userToken,
        },
        body: rental,
      );
      return response.statusCode == 200;
    } catch (e) {
      throw Exception('Can\'t connect to server! ${e.toString()}');
    }
  }

  Future<Uint8List> showAllMoviesRentByUser(User user) async {
    try{
      User reqUser = User(id: user.id, username: "", password: "");
      final response = await client.post(
        Uri.parse(rentalMoviesByUser),
        headers: {
          'Content-Type': 'application/x-protobuf',
          'X-Student-Token' : userToken
        },
        body: reqUser
      );
      return response.bodyBytes;
    } catch (e) {
      throw Exception('Can\'t connect to server! ${e.toString()}');
    }
  }

  Future<bool> returnMovie(int userId, int movieId) async {
    try {
      Rental rental = Rental(userId: userId, movieId: movieId);
      final response = await client.post(
        Uri.parse(watchMovie),
        headers: {
          'Content-Type': 'application/x-protobuf',
          'X-Student-Token': userToken
        },
        body: rental
      );

      return response.statusCode == 200;
    } catch (e){
      throw Exception('Can\'t connect to server! ${e.toString()}');
    }
  }
}
