import 'package:e_commerce_flutter/application/auth/register_notifier.dart';
import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/domain/models/user.dart';
import 'package:e_commerce_flutter/presentation/screens/login/login_creen.dart';
import 'package:e_commerce_flutter/presentation/widgets/generic_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  final Map<String, String?> _errors = {};

  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;

  void _validateAndRegister() async {
    setState(() {
      _errors.clear();
      if (_nameController.text.trim().isEmpty) {
        _errors['name'] = 'El nombre es obligatorio';
      }
      if (_usernameController.text.trim().isEmpty) {
        _errors['username'] = 'El usuario es obligatorio';
      }
      if (_passwordController.text.isEmpty) {
        _errors['password'] = 'La contraseña es obligatoria';
      } else if (_passwordController.text.length < 6) {
        _errors['password'] = 'Mínimo 6 caracteres';
      }
      if (_repeatPasswordController.text.isEmpty) {
        _errors['repeat'] = 'Repite la contraseña';
      } else if (_repeatPasswordController.text != _passwordController.text) {
        _errors['repeat'] = 'Las contraseñas no coinciden';
      }
    });

    if (_errors.isEmpty) {
      await ref.read(registerProvider.notifier).register(
            User(
              name: _nameController.text,
              username: _usernameController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.success) {
        showDialog(
          context: context,
          builder: (context) => GenericDialog(
            title: '¡Registro exitoso!',
            message: 'Tu usuario ha sido creado correctamente.',
            primaryButtonText: 'Aceptar',
            secondaryButtonText: 'Cerrar',
            onPrimary: () {
              Navigator.of(context, rootNavigator: true).pop();
              ref.read(registerProvider.notifier).clear();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
            onSecondary: () {
              Navigator.of(context, rootNavigator: true).pop();
              ref.read(registerProvider.notifier).clear(); 
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
              ref.read(registerProvider.notifier).clear(); 
            },
            onSecondary: () {
              Navigator.of(context, rootNavigator: true).pop();
              ref.read(registerProvider.notifier).clear(); 
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
                'Registro',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.badge_outlined),
                  labelText: 'Nombre',
                  border: const UnderlineInputBorder(),
                  errorText: _errors['name'],
                ),
              ),
              const SizedBox(height: defaultPadding),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline),
                  labelText: 'Nombre de Usuario',
                  border: const UnderlineInputBorder(),
                  errorText: _errors['username'],
                ),
              ),
              const SizedBox(height: defaultPadding),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelText: 'Contraseña',
                  border: const UnderlineInputBorder(),
                  errorText: _errors['password'],
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
              const SizedBox(height: defaultPadding),
              TextField(
                controller: _repeatPasswordController,
                obscureText: _obscureRepeatPassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelText: 'Repetir Contraseña',
                  border: const UnderlineInputBorder(),
                  errorText: _errors['repeat'],
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureRepeatPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureRepeatPassword = !_obscureRepeatPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: textColor,
                  ),
                  onPressed: state.isLoading ? null : _validateAndRegister,
                  child: state.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Registrarse',
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