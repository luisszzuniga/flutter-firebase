import 'package:firebase/models/declared_dog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeclaredDogDetailsScreen extends StatefulWidget {
  const DeclaredDogDetailsScreen({Key? key, required this.dog}) : super(key: key);

  final DeclaredDog dog;

  @override
  State<DeclaredDogDetailsScreen> createState() => _DeclaredDogDetailsState();
}

class _DeclaredDogDetailsState extends State<DeclaredDogDetailsScreen> {
  final User? _user = FirebaseAuth.instance.currentUser;
  bool _hasVoted = false;

  void _dogStillAtLocation() {
    setState(() {
      _hasVoted = true;
    });

    final db = FirebaseFirestore.instance;

    db.collection("declared_dogs").doc(widget.dog.id).update({
      'visibleCount': FieldValue.increment(1),
    });
  }

  void _dogNotLocated() {
    setState(() {
      _hasVoted = true;
    });

    final db = FirebaseFirestore.instance;

    db.collection("declared_dogs").doc(widget.dog.id).update({
      'notVisibleCount': FieldValue.increment(1),
    });
  }

  void _deleteDog() {
    final db = FirebaseFirestore.instance;

    db.collection("declared_dogs").doc(widget.dog.id).delete();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Chien déclaré'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_hasVoted == false)
              ElevatedButton(
                onPressed: _dogStillAtLocation,
                child: const Text('Le chien est toujours là'),
              ),
            if (_hasVoted == false)
              ElevatedButton(
                onPressed: _dogNotLocated,
                child: const Text('Le chien est parti'),
              ),

            if (_user != null && _user.uid == widget.dog.userId)
              ElevatedButton(
                onPressed: _deleteDog,
                child: const Text('Supprimer'),
              ),
          ],
        ),
      ),
    );
  }
}
