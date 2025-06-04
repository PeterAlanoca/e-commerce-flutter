import 'package:e_commerce_flutter/base/constants.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.badge_outlined),
                  labelText: 'Nombre',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: defaultPadding),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  labelText: 'Nombre de Usuario',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: defaultPadding),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: 'Contraseña',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: defaultPadding),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: 'Repetir Contraseña',
                  border: UnderlineInputBorder(),
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
                  onPressed: () {
                    // Acción de registro
                  },
                  child: const Text(
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