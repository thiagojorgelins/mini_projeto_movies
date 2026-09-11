import 'dart:typed_data';

import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';

class MovieAdapter {
  static Movies decodeMovie(Uint8List encodeMovie) {
    try {
      return Movies.fromBuffer(encodeMovie);
    } catch (e) {
      throw Exception('Error to decode movie');
    }
  }

  static Uint8List encodedRental(Rental rental){
    return rental.writeToBuffer();
  }

  static Uint8List encodedMovie(Movie movie) {
    return movie.writeToBuffer();
  }
}
