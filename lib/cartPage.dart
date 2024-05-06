import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './cart_provider.dart';
import './product.dart';
import './item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'My Cart',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Consumer<CartProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  child: ListView.builder(
                    itemCount: provider.items.length,
                    itemBuilder: (context, index) {
                      Item product = provider.items[index];
                      return ListTile(
                        title: Text(product.name),
                        onLongPress: () {
                          provider.remove(product);
                        },
                      );
                    },
                  ),
                ),
                Text("Total Cost Is ${provider.getCartTotal()}")
              ],
            );
          },
        ));
  }
}
