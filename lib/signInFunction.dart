import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './profile.dart';
import './profileScreen.dart';
import './home/home_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import './item.dart';

void click(_emailController, _passwordController, context) async {
  try {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: LoadingAnimationWidget.beat(
              color: Colors.white,
              size: 50,
            ),
          );
        });
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
    if (PRODUCTS.length == 0) {
      var db = FirebaseFirestore.instance;
      await db.collection("items").get().then(
        (querySnapshot) {
          print("Successfully completed");
          for (var docSnapshot in querySnapshot.docs) {
            print('${docSnapshot.id} => ${docSnapshot.data()}');
            var data = docSnapshot.data();
            //print(docSnapshot.data()['phone']);
            PRODUCTS.add(new Item(
                name: data["name"],
                unit: data["description"],
                price: data["price"],
                image: data["image"],
                size: data["size"],
                favor: data["favor"],
                category: data["category"]));
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
    }
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomeScreen(
            // items: PRODUCTS,
            ),
      ),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
