import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String? _successMessage;

  Future<void> _passwordReset() async {
    await FirebaseAuth.instance
      .sendPasswordResetEmail(email: _emailController.text);

    setState(() {
      _successMessage = 'Si un compte existe avec cet email, un email de récupération de mot de passe vous a été envoyé.';
    });
  }

  _login() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Récupération de mot de passe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),

            if (_successMessage != null)
              Text(
                _successMessage!,
                style: const TextStyle(color: Colors.green),
              ),

            const SizedBox(height: 16),
    
            ElevatedButton(
              onPressed: _passwordReset,
              child: const Text('Récupérer mon mot de passe'),
            ),

            ElevatedButton(
              onPressed: _login,
              child: const Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}
