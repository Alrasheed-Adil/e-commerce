import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './signIn.dart';

void register(_email, _password, _firstName, _lastName, context) async {
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text);
    await userCredential.user
        ?.updateDisplayName(_firstName.text + " " + _lastName.text);
    // .then((value) async => {
    //       await firestore.collection('users').doc(value.user!.uid).set(
    //           {'firstName': _firstName.text, 'lastName': _lastName.text})

    //       // print('ID Assigned successfully!');
    //     });
    print("User Created Successfully");
    //await _auth.user?.updateDisplayName("Jane Q. User");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignInPage(),
      ),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('The email address is already in use.')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Registration failed.')));
    }
  }
}
