import 'package:chat_app_lozada/views/authenticate/register.dart';
import 'package:chat_app_lozada/views/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (showSignIn)
        ? SignIn(toggleView: toggleView)
        : Register(toggleView: toggleView);
  }
}
