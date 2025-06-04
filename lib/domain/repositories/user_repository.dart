import 'package:e_commerce_flutter/domain/models/user.dart';
import 'package:hive/hive.dart';

class UserRepository {
  final Box box = Hive.box('users');

  Future<bool> exists(String username) async {
    return box.containsKey(username);
  }

  Future<void> saveUser(User user) async {
    await box.put(user.username, user.toMap());
  }
}