import 'package:flutter/material.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constant.dart';

import '../../shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({required this.toggleView});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email= '';
  String password ='';
  String error ='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
        actions: <Widget>[
          ElevatedButton.icon(onPressed: (){
            widget.toggleView();
          },
              label: Text("Register"),
              icon: Icon(Icons.person),
          ),
          ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: Form(
          key: _formKey,
           child: Column(
             children: <Widget>[
               SizedBox(height: 20,),
               TextFormField(
                 decoration: textInputDecoration.copyWith(hintText: 'Email'),
                 validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                 onChanged: (val){
                  setState(() => email = val);
                 },
               ),
               SizedBox(height: 20,),
               TextFormField(
                 decoration: textInputDecoration.copyWith(hintText: 'Password'),
                 validator: (val)=> val!.length < 6 ? 'Enter a password 6+ chars long' : null,
                 obscureText: true,
                 onChanged: (val){
                   setState(() => password = val);
                 },
               ),
               SizedBox(height: 20,),
               ElevatedButton(
                   onPressed: () async{
                     if(_formKey.currentState!.validate()){
                       setState(() => loading = true);
                       dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                       //dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                       if(result == null){
                         setState(() {
                           error = 'Could not sign in with those credentials';
                           loading = false;
                         });
                       }
                     }
                   },
                   child: Text("Sign In", style: TextStyle(color: Colors.black),),
               ),
               SizedBox(height: 12.0),
               Text(
                 error,
                 style: TextStyle(color: Colors.red, fontSize: 14.0),
               ),
           ],
           ),
        ),
      )
    );
  }
}
