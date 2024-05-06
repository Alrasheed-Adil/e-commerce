// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../cart_provider.dart';
import 'package:provider/provider.dart';
// import '../../models/Product.dart';
import '../../item.dart';

import '../../../constants.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final Item product;
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, provider, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: kDefaultPaddin),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: product.favor ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  provider.like(product);
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  provider.add(product);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  backgroundColor: Color(0xFF3D82AE),
                ),
                child: Text(
                  "ADD TO CART".toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
