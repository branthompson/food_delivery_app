import 'package:dishdash/components/my_button.dart';
import 'package:dishdash/components/my_cart_section.dart';
import 'package:dishdash/models/restaurant.dart';
import 'package:dishdash/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:(context, restaurant, child){
      final userCart=restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear cart
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                restaurant.clearCart();
              }, 
              icon: const Icon(Icons.delete),
              ),
              
          ],
        ),
        body: Column(
          children: [

            //
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder:(context, index){ 
                      final cartItem = userCart[index];
                      return MyCartSection(cartItem:cartItem);
                      
                      },
                      ),
                    ),
                ],
              ),
            ),
            //pay button
            MyButton(
              text: "Checkout", 
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PaymentScreen())
                );
              }
              ),
          ],
        )
      );
    });
  }
}