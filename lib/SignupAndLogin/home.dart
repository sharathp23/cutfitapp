import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Create a Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Create a boolean variable to track if the logout process is in progress
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// Add a text widget to display the user's name
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(_auth.currentUser?.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Text(
                  'Welcome, ${snapshot.data?.get('name')}!',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            ElevatedButton(
              child: Text('About'),
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
            ),

            // Add a button for logout
            ElevatedButton(
              child: _isLoading ? CircularProgressIndicator() : Text('Log Out'),
              onPressed: _isLoading ? null : _logOut,
            ),
          ],
        ),
      ),
    );
  }

// Create a function to handle logout
  void _logOut() async {
    setState(() {
      _isLoading = true;
    });
    await _auth.signOut();

    Navigator.pushReplacementNamed(context, '/');
  }
}
