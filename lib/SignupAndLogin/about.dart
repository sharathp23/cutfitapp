import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // Create a Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add a text widget to display the user's information
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(_auth.currentUser?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                return Column(
                  children: [
                    Text(
                      'Name: ${snapshot.data?.get('name') ?? ''}',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Age: ${snapshot.data?.get('age') ?? ''}',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Height: ${snapshot.data?.get('height') ?? ''} cm',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Weight: ${snapshot.data?.get('weight') ?? ''} kg',
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Email: ${snapshot.data?.get('email') ?? ''}',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                );
              },
            ),
            ElevatedButton(
              child: Text('Back to Home'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

