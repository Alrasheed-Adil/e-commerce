// Import the firebase_core and cloud_firestore plugin

import 'package:MyStore/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User? user = FirebaseAuth.instance.currentUser;

// Create a CollectionReference called users that references the firestore collection
CollectionReference Order = FirebaseFirestore.instance.collection('orders');

List<Map> orders = [];
Future<void> createOrder(context, items) {
  items.forEach((element) {
    orders.add({
      "name": element.name,
      'price': element.price,
      'count': element.count,
      'description': element.unit
    });
  });

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => HomeScreen(),
    ),
  );

  // Call the user's CollectionReference to  add a new user
  // ordrs.add(new order(
  //   data: orders,
  //   date: DateTime.now().toString(),
  //   id: user!.uid.toString(), // Stokes and Sons
  //   status: 'Processing',
  // ));

  double total = orders.fold(0,
      (previousValue, item) => previousValue + item['price'] * item['count']);

  return Order.add({
    'products': orders,
    'date': DateTime.now().toString(),
    'id': user!.uid, // Stokes and Sons
    'status': 'Processing',
    'total': total
  })
      .then((value) => {items.clear(), orders.clear()})
      .catchError((error) => print("Failed to add Order: $error"));
}
