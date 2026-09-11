import 'dart:typed_data';

import 'package:mini_projeto_movies/src/shared/proto/message.pb.dart';

class UserAdapter {
  static User decodeProto(Uint8List encodeUser) {
    try {
      return User.fromBuffer(encodeUser);
    } catch (e) {
      throw Exception('Error to decode user');
    }
  }

  static Uint8List encodedProto(User user) {
    return user.writeToBuffer();
  }
}
