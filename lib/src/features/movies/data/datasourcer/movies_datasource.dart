import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:mini_projeto_movies/src/core/networks/server.address.dart';

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

  Future<bool> rentMovie(Uint8List rental) async {
    try {
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

  Future<Uint8List> showAllMoviesRentByUser(Uint8List user) async {
    try {
      final response = await client.post(
        Uri.parse(rentalMoviesByUser),
        headers: {
          'Content-Type': 'application/x-protobuf',
          'X-Student-Token': userToken,
        },
        body: user,
      );
      return response.bodyBytes;
    } catch (e) {
      throw Exception('Can\'t connect to server! ${e.toString()}');
    }
  }

  Future<bool> returnMovie(Uint8List rental) async {
    try {
      final response = await client.post(
        Uri.parse(watchMovie),
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
}
