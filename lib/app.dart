import 'package:flutter/material.dart';
import 'map/index_screen.dart';
import 'map/declare_dog_screen.dart';
import 'map/declared_dog_details_screen.dart';
import 'auth/login_screen.dart';
import 'auth/reset_password_screen.dart';
import 'auth/register_screen.dart';
import 'models/declared_dog.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final routes = {
      '/index': (context) => IndexScreen(),
      '/declare': (context) => DeclareDogScreen(),
      '/login': (context) => LoginScreen(),
      '/register': (context) => RegisterScreen(),
      '/passwordReset': (context) => ResetPasswordScreen(),
    };

    return MaterialApp(
      title: 'Déclaration de chiens en liberté',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IndexScreen(),
      routes: routes,
      onGenerateRoute: (settings) {
        // Cas spécifique pour la page de détails d'un chien déclaré qui prend un paramètre DeclaredDog
        if (settings.name == '/dogDetails') {
          final dog = settings.arguments as DeclaredDog;
          return MaterialPageRoute(
            builder: (context) => DeclaredDogDetailsScreen(dog: dog),
          );
        }
        return null;
      },
    );
  }
}
