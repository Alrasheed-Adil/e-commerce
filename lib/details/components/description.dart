import 'package:flutter/material.dart';
import '../../../models/item.dart';
import '../../models/constants.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final Item product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.unit,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
