import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'tiles_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/declared_dog.dart';

class IndexScreen extends StatefulWidget {
  @override
  State<IndexScreen> createState() => _IndexState();
}

class _IndexState extends State<IndexScreen> {
  User? _user = FirebaseAuth.instance.currentUser;
  LatLng _currentPosition = const LatLng(51.5, -0.09);
  late final MapController _mapController;
  List<DeclaredDog> _declaredDogs = [];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getCurrentLocation();
    _getDeclaredDogs();
    _listenToDeclaredDogs();
  }

  Future<void> _getDeclaredDogs() async {
    final db = FirebaseFirestore.instance;

    final declaredDogsSnapshot = await db.collection("declared_dogs").get();

    setState(() {
      _declaredDogs = declaredDogsSnapshot.docs
          .map((doc) => DeclaredDog.fromJson(doc.data()).copyWith(id: doc.id))
          .toList();
    });
  }

  void _listenToDeclaredDogs() {
    // Temps réel
    final db = FirebaseFirestore.instance;

    db.collection("declared_dogs").snapshots().listen((snapshot) {
      final dogs = snapshot.docs.map((doc) {
        return DeclaredDog.fromJson(doc.data()).copyWith(id: doc.id);
      }).toList();

      setState(() {
        _declaredDogs = dogs;
      });
    });
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

    // Centrer la carte sur la position actuelle
    _mapController.move(_currentPosition, 13.0);
  }

  void _declareDog() {
    // Rediriger vers la page de déclaration si authentifié, sinon vers la page de connexion
    if (_user != null) {
      Navigator.pushNamed(context, '/declare');
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  void _logout() {
    FirebaseAuth.instance.signOut();
    setState(() {
      _user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Carte des chiens en liberté'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _currentPosition,
                initialZoom: 13.0,
                cameraConstraint: CameraConstraint.contain(
                  bounds: LatLngBounds(
                    const LatLng(-90, -180),
                    const LatLng(90, 180),
                  ),
                ),
              ),
              children: [
                openStreetMapTileLayer,
                RichAttributionWidget(
                  popupInitialDisplayDuration: const Duration(seconds: 5),
                  animationConfig: const ScaleRAWA(),
                  showFlutterMapAttribution: false,
                  attributions: [
                    TextSourceAttribution(
                      'OpenStreetMap contributors',
                      onTap: () async => launchUrl(
                        Uri.parse('https://openstreetmap.org/copyright'),
                      ),
                    ),
                    const TextSourceAttribution(
                      'This attribution is the same throughout this app, except '
                      'where otherwise specified',
                      prependCopyright: false,
                    ),
                  ],
                ),

                MarkerLayer(
                  markers: [
                    // Marqueur pour la position actuelle (bleu fluo)
                    Marker(
                      point: _currentPosition,
                      width: 30.0,
                      height: 30.0,
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),

                    // Marqueurs pour chaque DeclaredDog (rouge)
                    ..._declaredDogs.map(
                      (dog) => Marker(
                        point: LatLng(dog.latitude, dog.longitude),
                        width: 20,
                        height: 20,
                        child: GestureDetector(
                          onTap: () {
                            if (_user == null) {
                              Navigator.pushNamed(context, '/login');
                              return;
                            }

                            Navigator.pushNamed(
                              context,
                              '/dogDetails',
                              arguments: dog,
                            );
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                )

              ],
            ),
          ),

          // Déconnexion (si auth)
          if (_user != null) ...[
            Text('Connecté en tant que ${_user!.email}'),
            ElevatedButton(
              onPressed: _logout,
              child: const Text('Déconnexion'),
            ),
          ],
        ],
      ),

      // Bouton pour déclarer un chien
      floatingActionButton: FloatingActionButton(
        onPressed: _declareDog,
        tooltip: 'Déclarer un chien',
        child: const Icon(Icons.add),
      ),
    );
  }
}
