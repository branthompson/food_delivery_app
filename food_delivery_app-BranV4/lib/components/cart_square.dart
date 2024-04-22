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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
        margin: const EdgeInsets.symmetric(horizontal:25, vertical: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text('\$'+ cartItem.food.price.toString(),
                    style: TextStyle(color: Theme.of(context).colorScheme.primary)
                    ),
                  ],
                ),

                const Spacer(),
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
          ),
            //addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0:60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10, ),
                children: cartItem.selectedAddons
                .map((addon)=> 
              
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Row(
                      children: [
                        //name
                        Text(addon.name),
                        //price
                        Text('(\$${addon.price})'),
                      ],
                    ),
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,                    ),
                    ), 
                    onSelected: (value) {},
                    backgroundColor: 
                      Theme.of(context).colorScheme.secondary,
                    labelStyle: TextStyle(
                      color: 
                        Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 11,
                        ),
                    ),
                )).toList(),
              ),
            ),
            
              ],
            ),
      ),
         
          
        );
  }
}