import 'package:flutter/material.dart';
import 'package:voyage_app/pages/parameter.dart';
import 'package:voyage_app/pages/pays.dart';

import '../menu/Mydrawer.dart';
import 'authentification.dart';
import 'contact.dart';
import 'gallery.dart';
import 'meteo.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Mydrawer(),
      appBar: AppBar(
        title: Center(child: Text("Home page")),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Wrap(
          children: [
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: AssetImage('images/meteo.png')),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => meteo()));

              },
            ),
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: AssetImage('images/contact.png')),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactePage()));

              },
            ),
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: AssetImage('images/gallerie.png')),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => gallery()));

              },
            ),
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: AssetImage('images/parametres.png')),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => parameter()));

              },
            ),
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: AssetImage('images/pays.png')),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => pays()));

              },
            ),
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: AssetImage('images/deconnexion.png')),
              onTap: (){
                _onDeconnexionPressed(context);
              },
            )
          ],
        ),
      ),
    );
  }

  // Fonction pour gérer le bouton de déconnexion
  Future<void> _onDeconnexionPressed(BuildContext context) async {
    // Code de déconnexion ici (par exemple, suppression des informations de connexion)
    // Vous pouvez ici supprimer les données d'identification stockées ou effectuer d'autres actions nécessaires

    // Navigation vers la page d'authentification et suppression des routes précédentes
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthentificationPage()));

  }

}