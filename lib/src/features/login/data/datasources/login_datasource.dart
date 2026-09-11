import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:mini_projeto_movies/src/core/networks/server.address.dart';

class LoginDatasource {
  final client = http.Client();

  Future<Uint8List> login(Uint8List user) async {
    try {
      final response = await client.post(
        Uri.parse(doLogin),
        headers: {'Content-Type': 'application/x-protobuf'},
        body: user,
      );
      return response.bodyBytes;
    } catch (e) {
      throw Exception('Can\t connect to server! ${e.toString()}');
    }
  }
}
