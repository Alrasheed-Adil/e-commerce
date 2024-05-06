import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './cart_provider.dart';
import 'package:provider/provider.dart';
import './item.dart';
import './cartPage.dart';

class MyCard extends StatelessWidget {
  List<Item> items;
  MyCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
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
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              CartProvider cartProvider = Provider.of<CartProvider>(context);
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Card(
                    color: Colors.white,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Row(
                          children: <Widget>[
                            // ListTile(
                            //   // leading: Icon(Icons.arrow_drop_down_circle),
                            //   title: Text(
                            //     'Iphone 13 Pro Max',
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 20,
                            //     ),
                            //   ),
                            // ),
                            //   // subtitle: Text(
                            //   //   '200S',
                            //   //   style:
                            //   //       TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            //   // ),
                            // ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 15.0, top: 15),
                              child: Text(items[index].name.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontFamily: 'Montserrat',
                                    fontSize: 20,
                                  )),
                            ),
                            Spacer(),
                            Container(
                              margin: const EdgeInsets.only(top: 15.0),
                              child: TextButton(
                                child: Text(
                                  items[index].price.toString() + "\$",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        Container(
                          child: Image.asset(
                            items[index].image.toString(),
                            fit: BoxFit.contain,
                          ),
                          width: 350,
                          height: 150,
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            items[index].unit.toString(),
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, right: 10, left: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {
                                cartProvider.add(items[index]);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  height: 380,
                  width: 350,
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: const Color.fromARGB(255, 209, 209, 209),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
