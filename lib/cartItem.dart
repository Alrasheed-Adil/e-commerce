import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../models/Product.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  Color color;

  ItemCard(
      {super.key,
      required this.product,
      required this.press,
      required this.color});

  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blue, width: 2.0)),
            child: Hero(
              tag: "${product.id}",
              child: Image.asset(product.image),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // SizedBox(width: 10, height: 10),
        ],
      ),
    );
  }
}
