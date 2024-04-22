import 'package:dishdash/components/my_button.dart';
import 'package:dishdash/components/my_textfield.dart';
import 'package:dishdash/services/auth/auth_services.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key, required this.onTap});

  void Function()? onTap;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pswController = TextEditingController();


  // LOGIN
  void login() async{

    final _authService = AuthService();

    try{
      await _authService.signIn(emailController.text, pswController.text);
    }
    catch (e){
      showDialog(
        context: context, 
        builder: (context)=> AlertDialog(
          title: Text(e.toString()),
        )
        );
    }
    // After logging in, Navigate to home screen
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()),);



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.delivery_dining_outlined,
              size: 90,
              color:Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 7),
            Text(
                'D I S H D A S H',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            SizedBox(height: 17),
            MyTextfield(controller: emailController, hintText: 'Email'),
            SizedBox(height: 17),
            MyTextfield(controller: pswController, hintText: 'Password'),
            SizedBox(height: 17),
            MyButton(text: 'Login', onTap: login),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('No Account?'),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
