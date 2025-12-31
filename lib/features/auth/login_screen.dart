import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/widgets/custom_text_field.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 48),
              // Logo/Image Placeholder
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    PhosphorIcons.graduationCap(PhosphorIconsStyle.fill),
                    size: 64,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Ce-LOE LMS',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 64),
              
              // Form
              const CustomTextField(
                label: 'Nama Pengguna', // Username
                hint: 'Masukkan nama pengguna',
                keyboardType: TextInputType.text,
                prefixIcon: Icon(Icons.person_outline),
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                label: 'Kata Sandi', // Password
                hint: 'Masukkan kata sandi',
                obscureText: true,
                prefixIcon: Icon(Icons.lock_outline),
              ),
              
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Lupa Kata Sandi?'),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Login Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to Home
                  context.go('/home');
                },
                child: const Text('Masuk'), // Log In
              ),
              
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
