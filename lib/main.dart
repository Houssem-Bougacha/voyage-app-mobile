
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage_app/pages/authentification.dart';
import 'package:voyage_app/pages/contact.dart';
import 'package:voyage_app/pages/gallery.dart';
import 'package:voyage_app/pages/home.dart';
import 'package:voyage_app/pages/inscription.page.dart';
import 'package:voyage_app/pages/meteo.dart';
import 'package:voyage_app/pages/parameter.dart';
import 'package:voyage_app/pages/pays.dart';
import 'package:firebase_core/firebase_core.dart';
import './firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final routes = {
    '/inscription': (context) => InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/home': (context) => home(),
    '/contact':(context)=> ContactePage(),
    '/gallery':(context)=>gallery(),
    '/meteo':(context)=>meteo(),
    '/parameter':(context)=>parameter(),
    '/pays':(context)=>pays(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return home(); // Assuming HomePage is a Widget class
          } else {
            return AuthentificationPage(); // Assuming AuthenticationPage is a Widget class
          }
        },
      ),
    );
  }
}
