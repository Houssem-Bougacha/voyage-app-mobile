import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../menu/Mydrawer.dart';

class parameter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:Mydrawer(),
      appBar: AppBar(
        title: Center(child: Text("parameter page")),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenue sur la page parameter',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }



}

