import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/Mydrawer.dart';
import 'gallerie-details.page.dart';

class gallery extends StatelessWidget {
  TextEditingController txt_galerry = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      appBar: AppBar(
        title: Center(child: Text("gellery Page")),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue sur la page gallery',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: txt_galerry,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.sunny),
                hintText: "gallery",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _onGetMeteoDetails(context);
              },
              child: Text("chercher"),
              style: ElevatedButton.styleFrom(maximumSize: Size.fromHeight(50)),
            )
          ],
        ),
      ),
    );
  }

  void _onGetMeteoDetails(BuildContext context) {
    String v = txt_galerry.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GallerieDetails(v)),
    );
    txt_galerry.text = "";
  }
}
