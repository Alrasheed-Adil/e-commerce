import 'package:MyStore/Orders.dart';
import 'package:MyStore/cartScreen.dart';
import 'package:MyStore/orderList.dart';
import 'package:MyStore/readData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';

// import '../../models/Product.dart';
import '../item.dart';
import '../details/details_screen.dart';
import 'components/categorries.dart';
import 'components/item_card.dart';
import '../profileScreen.dart';
import '../signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Color(0xFF3D82AE),
      Color.fromARGB(255, 236, 224, 56),
      Color.fromARGB(255, 35, 163, 99),
      Color.fromARGB(255, 167, 53, 148)
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: SvgPicture.asset("icons/back.svg"),
        //   onPressed: () {},
        // ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.network(
              "https://firebasestorage.googleapis.com/v0/b/e-cart-d8427.appspot.com/o/search.svg?alt=media&token=84abef2f-2e7a-4e67-9a60-1caf9ceeed1f",
              colorFilter: ColorFilter.mode(kTextColor, BlendMode.srcIn),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.network(
              "https://firebasestorage.googleapis.com/v0/b/e-cart-d8427.appspot.com/o/cart.svg?alt=media&token=8e6e86a9-096d-4fb0-8009-61ba967292fd",
              colorFilter: ColorFilter.mode(kTextColor, BlendMode.srcIn),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartPage(
                      // items: PRODUCTS,
                      ),
                ),
              );
            },
          ),
          SizedBox(width: kDefaultPaddin)
        ],
      ),
      drawer: _buildDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              "6 store",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
                itemCount: PRODUCTS.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: PRODUCTS[index],
                  color: colors[index % 4],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: PRODUCTS[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

Drawer _buildDrawer(BuildContext context) {
  User? user = FirebaseAuth.instance.currentUser;
  return Drawer(
      child: Column(
    children: [
      Expanded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/e-cart-d8427.appspot.com/o/profile-1.png?alt=media&token=cc64bf2d-5ed8-40c7-b79b-727da9268119'),
              ),
              accountEmail: user != null
                  ? Text(user.email.toString(),
                      style: TextStyle(fontSize: 15, letterSpacing: 1.2))
                  : Text("Default@email.com"),
              accountName: user != null
                  ? Text(user.displayName.toString().toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          letterSpacing: 1.2))
                  : Text("jhone Doe"),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.all(bo),
                color: Color(0xFF3D82AE),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 14.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 14.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Profile(
                        // "alrasheed",
                        // "adil",
                        // "Sprize016@gmail.com",
                        ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text(
                'Cart',
                style: TextStyle(fontSize: 14.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CartPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.library_books,
                // color: Colors.red,
              ),
              title: const Text(
                'Orders',
                style: TextStyle(fontSize: 14.0),
              ),
              onTap: () {
                GetOrders(context);
              },
            ),
            const Divider(
              height: 10,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: const Text(
                'Favorites',
                style: TextStyle(fontSize: 14.0),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      ListTile(
          title: Text('Logout'),
          leading: Icon(
            Icons.logout,
            color: Colors.red,
          ),
          onTap: () async {
            await FirebaseAuth.instance.signOut().then((value) => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()))
                });
          })
    ],
  ));
}
