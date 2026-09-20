import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';

class Register extends StatefulWidget {


  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}
  final AuthService _auth = AuthService();

  //text field state
  String email= '';
  String password ='';

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text("Sign_up to Brew Crew"),
          actions: <Widget>[
            ElevatedButton.icon(onPressed: (){
              widget.toggleView();
            },
              label: Text("Sign_In"),
              icon: Icon(Icons.person),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                TextFormField(
                  onChanged: (val){
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(

                  obscureText: true,
                  onChanged: (val){
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () async{
                    print(email);
                    print(password);
                  },
                  child: Text("Register", style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),
        )
    );
  }
}
