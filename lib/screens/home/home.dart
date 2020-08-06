import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/screens/home/settings_form.dart';
import 'package:flutter_firebase_project/services/auth.dart';
import 'package:flutter_firebase_project/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_project/screens/home/brew_list.dart';
import 'package:flutter_firebase_project/models/brew.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffe_bg.png'),
              fit: BoxFit.cover
            ),
          ),
          child: BrewList()
        ),
      ),
    );
  }
}