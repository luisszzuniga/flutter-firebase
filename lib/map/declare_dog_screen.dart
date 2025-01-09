import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DeclareDogScreen extends StatefulWidget {
  @override
  State<DeclareDogScreen> createState() => _IndexState();
}

class _IndexState extends State<DeclareDogScreen> {
  void _declareDog() {
    final user = FirebaseAuth.instance.currentUser;
    
    // Si l'utilisateur est connecté, redirection vers la page de déclaration
    // Sinon, redirection vers la page de connexion

    if (user != null) {
      Navigator.pushNamed(context, '/declare');
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Déclaration de chien en liberté'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'tesst',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _declareDog,
        tooltip: 'Déclarer un chien',
        child: const Icon(Icons.add),
      ),
    );
  }
}
