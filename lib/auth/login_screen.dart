import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/index', (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        setState(() {
          _errorMessage = 'Les identifiants sont incorrects.';
        });
      }
    }
  }

  _register() {
    Navigator.pushNamed(context, '/register');
  }

  _passwordReset() {
    Navigator.pushNamed(context, '/passwordReset');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Connexion')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),

            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _login,
              child: const Text('Se connecter'),
            ),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Inscription'),
            ),
            ElevatedButton(
              onPressed: _passwordReset,
              child: const Text('Mot de passe oublié'),
            ),
          ],
        ),
      ),
    );
  }
}
