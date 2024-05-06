import 'package:MyStore/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import './item.dart';
import './order.dart';
import './homepage.dart';
import './orderList.dart';

void GetProducts(context) async {
  // List<Item> items = [];
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
}

void GetOrders(context) async {
  ORDERS.clear();
  var db = FirebaseFirestore.instance;
  await db.collection("orders").get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
        var data = docSnapshot.data();
        //print(docSnapshot.data()['phone']);
        order temp = order(
            date: data["date"],
            data: data["products"],
            id: docSnapshot.id.toString(),
            status: data["status"],
            total: data["total"]);
        if (ORDERS.contains(temp)) {
        } else {
          ORDERS.add(temp);
        }
      }
      print("");
    },
    onError: (e) => print("Error completing: $e"),
  );
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => OrdersList(),
    ),
  );
}

// ordrs.add(new order(
  //   data: orders,
  //   date: DateTime.now().toString(),
  //   id: user!.uid.toString(), // Stokes and Sons
  //   status: 'Processing',
  // ));