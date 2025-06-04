import 'package:e_commerce_flutter/domain/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final bool isLoading;
  final String? error;
  final bool success;

  LoginState({this.isLoading = false, this.error, this.success = false});
}

class LoginNotifier extends StateNotifier<LoginState> {
  final UserRepository repository;
  LoginNotifier(this.repository) : super(LoginState());

  Future<void> login(String username, String password) async {
    state = LoginState(isLoading: true);
    final user = await repository.getUser(username);

    if (user == null) {
      state = LoginState(error: 'Usuario no encontrado');
      return;
    }
    if (user.password != password) {
      state = LoginState(error: 'Contraseña incorrecta');
      return;
    }
    state = LoginState(success: true);
  }

  void clear() {
    state = LoginState();
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(UserRepository());
});