import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/contact.dart';
import '../pages/gallery.dart';
import '../pages/home.dart';
import '../pages/meteo.dart';
import '../pages/parameter.dart';
import '../pages/pays.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader (
                decoration: BoxDecoration(
                    gradient: LinearGradient (colors: [Colors. blue, Colors. black])),
                child: Center(
                  child: CircleAvatar (
                    backgroundImage: AssetImage ("images/profil.jpg"),
                    radius: 80,
                  ),
                )),
            ListTile(
              title: Text ('Accueil', style: TextStyle (fontSize: 22)),
              leading: Icon (Icons. home, color: Colors. blue),
              trailing: Icon (Icons.arrow_right, color: Colors.blue),
              onTap: () {   Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => home()));},
            ),
            ListTile(
              title: Text ('Meteo', style: TextStyle (fontSize: 22)),
              leading: Icon (Icons.sunny, color: Colors. blue),
              trailing: Icon (Icons.arrow_right, color: Colors.blue),
              onTap: () {   Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => meteo()));
              },
            ),
            ListTile(
              title: Text ('Gallery', style: TextStyle (fontSize: 22)),
              leading: Icon (Icons.browse_gallery, color: Colors. blue),
              trailing: Icon (Icons.arrow_right, color: Colors.blue),
              onTap: () {   Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => gallery()));
              },
            ),
            ListTile(
              title: Text ('pays', style: TextStyle (fontSize: 22)),
              leading: Icon (Icons.villa, color: Colors. blue),
              trailing: Icon (Icons.arrow_right, color: Colors.blue),
              onTap: () {   Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => pays()));
              },
            ),
            ListTile(
              title: Text ('contact', style: TextStyle (fontSize: 22)),
              leading: Icon (Icons.contact_emergency, color: Colors. blue),
              trailing: Icon (Icons.arrow_right, color: Colors.blue),
              onTap: () {   Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactePage()));
              },
            ),
            ListTile(
              title: Text ('parametre', style: TextStyle (fontSize: 22)),
              leading: Icon (Icons.settings, color: Colors. blue),
              trailing: Icon (Icons.arrow_right, color: Colors.blue),
              onTap: () {   Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => parameter()));
              },
            ),
            ListTile(
              title: Text ('Dexcions', style: TextStyle (fontSize: 22)),
              leading: Icon (Icons.logout, color: Colors. blue),
              trailing: Icon (Icons.arrow_right, color: Colors.blue),
              onTap: () {   Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => home()));
              },
            ),
          ],
        ));
  }
}
