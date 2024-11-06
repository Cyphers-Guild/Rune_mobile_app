// lib/data/repositories/user_repository.dart

import 'package:rune/core/models/user_model.dart';

class UserRepository {
  Future<User> fetchUser() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));
    return User(id: '1', name: 'John Doe');
  }
}
