import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/Mydrawer.dart';
import 'meteo-details.page.dart';

class meteo extends StatelessWidget {
  TextEditingController txt_ville = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      appBar: AppBar(
        title: Center(child: Text("Meteo Page")),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue sur la page meteo',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: txt_ville,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.sunny),
                hintText: "pays",
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
    String v = txt_ville.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MeteoDetailsPage(v)),
    );
    txt_ville.text = "";
  }
}