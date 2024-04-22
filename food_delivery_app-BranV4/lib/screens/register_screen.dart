import 'package:dishdash/screens/home_screen.dart';
import 'package:dishdash/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController pswController = TextEditingController();
  final TextEditingController ConfirmPSWController = TextEditingController();
  //fill out auth
  void register() async{
    final _authService = AuthService();

    //check if passwords match
    if(pswController.text==ConfirmPSWController.text){
      try{
      await _authService.register(emailController.text, pswController.text);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));

      }

      catch (e){
        showDialog(
          context: context, 
          builder: (context)=> AlertDialog(
            title: Text(e.toString()),
          )
          );
      }
    }
    else{
      showDialog(
          context: context, 
          builder: (context)=> AlertDialog(
            title: Text("Your Passwords Don't Match "),
          ),

          );

    }
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
            MyTextfield(controller: ConfirmPSWController, hintText: 'Confirm Password'),
            SizedBox(height: 17),
            MyButton(text: 'Register', onTap: register),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an Account?'),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'LOGIN',
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
