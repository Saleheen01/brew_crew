import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/databse.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/screens/home/brew_list.dart';

class Home extends StatelessWidget {

   AuthService get _auth => AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
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

        body: BrewList(),
      ),
    );
  }
}
