import 'package:dishdash/screens/login_screen.dart';
import 'package:dishdash/screens/register_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  // Show login screen initially
  bool showLoginScreen = true;

  // toggle between the login and register screens with the onTap text
  void toggleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showLoginScreen) {
      return LoginScreen(onTap: toggleScreens);
    }
    else {
      return RegisterScreen(onTap: toggleScreens);
    }
  }
}
