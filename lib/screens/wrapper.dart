import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/screens/authenticate/authenticate.dart';
import 'package:flutter_firebase_project/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_project/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
