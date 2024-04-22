import 'package:dishdash/screens/login_screen.dart';
import 'package:dishdash/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget{
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState()=> _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister>{
  //show login
  bool showLoginScreen = true;
  //toggle login and register
  void toggleScreens(){
    setState(() {
      showLoginScreen=!showLoginScreen;
    });
  }
  @override
  Widget build(BuildContext context){
    if(showLoginScreen){
      return LoginScreen(onTap: toggleScreens);

    }else{
      return RegisterScreen(onTap: toggleScreens);
    }
  }
}