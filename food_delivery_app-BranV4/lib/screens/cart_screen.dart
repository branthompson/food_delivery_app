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
        actions: [
          //clear cart
          IconButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (context) => AlertDialog(
                  title: const Text("Are you sure you want to clear your cart, all the items will be removed."),
                  actions: [
                    //No
                    TextButton(
                    onPressed: (){
                      Navigator.pop(context);

                    }, 
                    child: const Text("Cancel")),
                    //Yes!
                    TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      restaurant.clearCart();
                    }, 
                    child: const Text("Yes")),


                  ]
                ),
                );
            }, 
            icon: const Icon(Icons.delete),
            )
        ],
      ),
      body: Column(
        children: [
          userCart.isEmpty ? 
          const Expanded(child: Text("Your cart is currently empty"),):  
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

