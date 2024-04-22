import 'package:dishdash/components/cart_square.dart';
import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget{
  const CartScreen({super.key});


  @override
  Widget build(BuildContext context){
    return Consumer<Restaurant>(builder: (context, restaurant, child){
    final userCart= restaurant.cart;

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userCart.length,
              itemBuilder: (context, index){
              //gets each cart item
              final cartItem = userCart[index];

              return CartSquare(cartItem: cartItem);
      

    },
    ),
          ),
        ],
      )
    );
    });
  }
}

