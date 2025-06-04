import 'package:e_commerce_flutter/application/auth/login_notifier.dart';
import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/presentation/screens/register/register_screen.dart';
import 'package:e_commerce_flutter/presentation/widgets/generic_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _validateAndLogin() async {
    await ref.read(loginProvider.notifier).login(
          _usernameController.text.trim(),
          _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.success) {
        showDialog(
          context: context,
          builder: (context) => GenericDialog(
            title: '¡Bienvenido!',
            message: 'Has iniciado sesión correctamente.',
            primaryButtonText: 'Aceptar',
            secondaryButtonText: 'Cerrar',
            onPrimary: () {
              Navigator.of(context, rootNavigator: true).pop();
              ref.read(loginProvider.notifier).clear();
              // Navega a tu pantalla principal aquí
            },
            onSecondary: () {
              Navigator.of(context, rootNavigator: true).pop();
              ref.read(loginProvider.notifier).clear();
            },
          ),
        );
      }
      if (state.error != null && state.error!.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) => GenericDialog(
            title: 'Error',
            message: state.error!,
            primaryButtonText: 'Aceptar',
            secondaryButtonText: 'Cerrar',
            onPrimary: () {
              Navigator.of(context, rootNavigator: true).pop();
              ref.read(loginProvider.notifier).clear();
            },
            onSecondary: () {
              Navigator.of(context, rootNavigator: true).pop();
              ref.read(loginProvider.notifier).clear();
            },
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Inventario',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  labelText: 'Nombre de Usuario',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelText: 'Contraseña',
                  border: const UnderlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text("No tienes una cuenta?"),
                  TextButton(
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                      );
                    },
                    child: const Text(
                      'Regístrate aquí',
                      style: TextStyle(color: accentColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: textColor,
                  ),
                  onPressed: state.isLoading ? null : _validateAndLogin,
                  child: state.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Iniciar Sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}