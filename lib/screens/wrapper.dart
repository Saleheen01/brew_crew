import 'package:flutter/material.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    //return either Home or Authenticate widget
    return Authenticate();
  }
}
