import 'package:flutter/material.dart';
import './cart_provider.dart';
import 'package:provider/provider.dart';
import './profile.dart';
import './item.dart';
import './cartPage.dart';

class shopingCart extends StatefulWidget {
  List<Item> items;
  shopingCart({super.key, required this.items});

  @override
  State<shopingCart> createState() => _shopingCartState();
}

class _shopingCartState extends State<shopingCart> {
  //List<Item> products = widget.items;
  // [
  //   Item(name: 'Apple', unit: 'Kg', price: 20, image: 'assets/apple.png'),
  //   Item(name: 'Mango', unit: 'Doz', price: 30, image: 'assets/mango.png'),
  //   Item(name: 'Banana', unit: 'Doz', price: 10, image: 'assets/banana.png'),
  //   Item(name: 'Grapes', unit: 'Kg', price: 8, image: 'assets/grapes.png'),
  //   Item(
  //       name: 'Strawberry',
  //       unit: 'Box',
  //       price: 12,
  //       image: 'assets/strawberry.png'),
  //   Item(
  //       name: 'Water Melon',
  //       unit: 'Kg',
  //       price: 25,
  //       image: 'assets/watermelon.png'),
  //   Item(name: 'Kiwi', unit: 'Pc', price: 40, image: 'assets/kiwi.png'),
  //   Item(name: 'Orange', unit: 'Doz', price: 15, image: 'assets/orange.png'),
  //   Item(name: 'Peach', unit: 'Pc', price: 8, image: 'assets/peach.png'),
  //   Item(
  //       name: 'Strawberry',
  //       unit: 'Box',
  //       price: 12,
  //       image: 'assets/strawberry.png'),
  //   Item(
  //       name: 'Fruit Basket',
  //       unit: 'Kg',
  //       price: 55,
  //       image: 'assets/fruitBasket.png'),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Product List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Badge(
            // badgeContent: Consumer<CartProvider>(
            //   builder: (context, value, child) {
            //     return Text(
            //       value.getCounter().toString(),
            //       style: const TextStyle(
            //           color: Colors.white, fontWeight: FontWeight.bold),
            //     );
            //   },
            // ),
            // position: const BadgePosition(start: 30, bottom: 30),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: const Icon(Icons.shopping_cart),
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          shrinkWrap: true,
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            CartProvider cartProvider = Provider.of<CartProvider>(context);
            return Card(
              color: Colors.white,
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image(
                      height: 80,
                      width: 80,
                      image: AssetImage(widget.items[index].image.toString()),
                    ),
                    SizedBox(
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5.0,
                          ),
                          RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            text: TextSpan(
                                text: 'Name: ',
                                style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 16.0),
                                children: [
                                  TextSpan(
                                      text:
                                          '${widget.items[index].name.toString()}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ]),
                          ),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                text: 'Unit: ',
                                style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 16.0),
                                children: [
                                  TextSpan(
                                      text:
                                          '${widget.items[index].unit.toString()}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ]),
                          ),
                          RichText(
                            maxLines: 1,
                            text: TextSpan(
                                text: 'Price: ' r"$",
                                style: TextStyle(
                                    color: Colors.blueGrey.shade800,
                                    fontSize: 16.0),
                                children: [
                                  TextSpan(
                                      text:
                                          '${widget.items[index].price.toString()}\n',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          cartProvider.add(widget.items[index]);
                        },
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
