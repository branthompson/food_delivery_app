import 'package:dishdash/components/quantity_selector.dart';
import 'package:dishdash/models/cart_item.dart';
import 'package:dishdash/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSquare extends StatelessWidget{
  final CartItem cartItem;
  const CartSquare({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
    builder: (context, restaurant, child) =>
      Container(
        child: Column(
          children: [
            Row(
              children: [
                //food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    cartItem.food.imagePath,
                    height: 80,
                    width: 80,
                  ),
                ),
                const SizedBox(width: 10,),
                //name and price
                Column(
                  children: [
                    //name
                    Text(cartItem.food.name),
                    //price
                    Text('\$'+ cartItem.food.price.toString()),
                  ],
                ),
                //increase or decrease amount
                QuantitySelector(
                quantity: cartItem.quantity, 
                food: cartItem.food, 
                onDecrement: () {
                  restaurant.removeFromCart(cartItem);
                }, 
                onIncrement: () {
                  restaurant.addToCart(
                    cartItem.food, cartItem.selectedAddons);
                },
               ),
            ],
          )


              ],
            ),
      ),
            //addons
          
        );
  }
}