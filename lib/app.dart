import 'package:flutter/material.dart';
import 'map/index_screen.dart';
import 'map/declare_dog_screen.dart';
import 'auth/login_screen.dart';
import 'auth/register_screen.dart';

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
    };

    return MaterialApp(
      title: 'Déclaration de chiens en liberté',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: IndexScreen(),
      routes: routes,
    );
  }
}
