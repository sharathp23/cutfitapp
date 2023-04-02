import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Create controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Create a GlobalKey for the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Create a Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a Firebase Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a boolean variable to track if the sign-up process is in progress
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Add a text field for name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    // use null check operator to fix the error
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              // Add a text field for age
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    // use null check operator to fix the error
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),

              // Add a text field for height
              TextFormField(
                controller: _heightController,
                decoration: InputDecoration(labelText: 'Height (in cm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    // use null check operator to fix the error
                    return 'Please enter your height';
                  }
                  return null;
                },
              ),

              // Add a text field for weight
              TextFormField(
                controller: _weightController,
                decoration: InputDecoration(labelText: 'Weight (in kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    // use null check operator to fix the error
                    return 'Please enter your weight';
                  }
                  return null;
                },
              ),

              // Add a text field for email
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    // use null check operator to fix the error
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),

              // Add a text field for password
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    // use null check operator to fix the error
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              // Add a button for sign up
              ElevatedButton(
                child:
                    _isLoading ? CircularProgressIndicator() : Text('Sign Up'),
                onPressed: _isLoading ? null : _signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Create a function to handle sign up
  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

   try {
  // Create a user with email and password
  final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
    email: _emailController.text.trim(),
    password: _passwordController.text.trim(),
  );

  // Add user information to Firestore
  final user = userCredential.user;
  if (user != null) { // null check added
    await _firestore.collection('users').doc(user.uid).set({
      'name': _nameController.text.trim(),
      'age': int.parse(_ageController.text.trim()),
      'height': int.parse(_heightController.text.trim()),
      'weight': int.parse(_weightController.text.trim()),
      'email': _emailController.text.trim(),
    });
  }

  // Navigate to the login page
  Navigator.pushReplacementNamed(context, '/login');
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('The password provided is too weak.'),
    ));
  } else if (e.code == 'email-already-in-use') {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('The account already exists for that email.'),
    ));
  }
} catch (e) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(e.toString()),
  ));
} finally {
  setState(() {
    _isLoading = false;
  });
}

    }
  }
}
