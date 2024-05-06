import 'package:MyStore/introductionScreen.dart';
import 'package:MyStore/signUp.dart';
import 'package:flutter/material.dart';
import './cart_provider.dart';
// import './login.dart';
import './signIn.dart';
// import './profile.dart';
// import './cart.dart';
// import './readData.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import './home/home_screen.dart';
// import './homepage.dart';
import './card.dart';
import 'package:google_fonts/google_fonts.dart';

bool userIsSignIn = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseAuth.instance.signOut();
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
      userIsSignIn = false;
    } else {
      print('User is signed in!');
      userIsSignIn = true;
    }
  });
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '6 Store',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          drawerTheme: const DrawerThemeData(
              // backgroundColor: Color(0xFF3D82AE),
              ),
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            color: Colors.deepPurpleAccent, //<-- SEE HERE
          ),
        ),
        home: Scaffold(
          body: Center(
            child: SignInPage(),
          ),
        ));
  }
}
// userIsSignIn ? UserProfilePage() :