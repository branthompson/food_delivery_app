import 'package:dishdash/components/my_quantity_cart.dart';
import 'package:dishdash/models/cart_item.dart';
import 'package:dishdash/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyCartSection extends StatelessWidget {
  final CartItem cartItem;
  const MyCartSection({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:(context, restaurant, child)=> Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column (
          children: [
            Row(
              children: [
                //image
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    cartItem.food.imagePath,
                    height: 90,
                    width: 90,
                    ),
                ),

                const SizedBox(width: 20,),
                //name + price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.food.name),
                    Text('\$'+cartItem.food.price.toString()),
                  ],
                ),

                //increase or decrease quantity
                 const SizedBox(width: 80,),

                QuantitySelector(
                  quantity: cartItem.quantity, 
                  food: cartItem.food, 
                  onDecrement: (){
                    restaurant.removeFromCart(cartItem);
                  }, 
                  onIncrement:(){
                    restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                  },
                  ),
                  //addons
                  
              ],
            ),
          ],
        ),
      ),
    );
  }
}