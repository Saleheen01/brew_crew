import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class Home extends StatelessWidget {

   AuthService get _auth => AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Brew_Crew"),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
         FilledButton.icon(
            onPressed: () async{
              await _auth.signOut();
            },
            icon: Icon(Icons.logout),
            label: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
