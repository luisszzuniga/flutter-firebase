import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import '../models/declared_dog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:latlong2/latlong.dart';

class DeclareDogScreen extends StatefulWidget {
  @override
  State<DeclareDogScreen> createState() => _DeclareDogState();
}

class _DeclareDogState extends State<DeclareDogScreen> {
  LatLng _currentPosition = const LatLng(51.5, -0.09);
  final User? _user = FirebaseAuth.instance.currentUser;
  final TextEditingController _descriptionController = TextEditingController();

  void _declareDog() async {
    final db = FirebaseFirestore.instance;

    await _getCurrentLocation();

    final declaredDog = DeclaredDog(
      latitude: _currentPosition.latitude,
      longitude: _currentPosition.longitude,
      notVisibleCount: 0,
      visibleCount: 0,
      userId: _user!.uid,
      description: _descriptionController.text,
    );

    db.collection("declared_dogs").add({
      ...declaredDog.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    Navigator.of(context).pop();
  }

  Future<void> _getCurrentLocation() async {
    // Vérifier et demander la permission de localisation
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    // Obtenir la position actuelle
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
    });
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
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
            ),

            ElevatedButton(
              onPressed: _declareDog,
              child: const Text('Déclarer un chien sur ma position'),
            ),
          ],
        ),
      ),
    );
  }
}
