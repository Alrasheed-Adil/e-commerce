import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import '../../models/Product.dart';
import '../../item.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  Color color;

  ItemCard(
      {super.key,
      required this.product,
      required this.press,
      required this.color});

  final Item product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xFF3D82AE), width: 2.0),
                  image: DecorationImage(image: NetworkImage(product.image))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.name,
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
