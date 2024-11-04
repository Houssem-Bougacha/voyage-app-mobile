import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(child: Text("Inscription ")),
            backgroundColor: Colors.blue),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_login,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: "identifinat",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_password,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _onInscrire(context);
                },
                style:
                ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                child: const Text("Inscription")),
            TextButton(onPressed: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/authentification');
            },
                child: const Text("J'ai deja un compte"))
          ],
        ));
  }


  Future<void> _onInscrire(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
      try {
        final credential = await _auth.createUserWithEmailAndPassword(
          email: txt_login.text,
          password: txt_password.text,
        );

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => home()));

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        } else {
          print('Error: ${e.message}');
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      const snackBar = SnackBar(
        content: Text('Identifiant ou mot de passe vides'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}