import 'package:e_commerce_flutter/domain/models/user.dart';
import 'package:e_commerce_flutter/domain/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterState {
  final bool isLoading;
  final String? error;
  final bool success;

  RegisterState({this.isLoading = false, this.error, this.success = false});
}

class RegisterNotifier extends StateNotifier<RegisterState> {
  final UserRepository repository;
  RegisterNotifier(this.repository) : super(RegisterState());

  Future<void> register(User user) async {
    state = RegisterState(isLoading: true);
    if (await repository.exists(user.username)) {
      state = RegisterState(error: 'El usuario ya existe');
      return;
    }
    await repository.saveUser(user);
    state = RegisterState(success: true);
  }

   void clear() {
    state = RegisterState();
  }
}

final registerProvider =
    StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  return RegisterNotifier(UserRepository());
});