import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food, required this.onTap});

  final Food food;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [

                // food text details
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // NAME OF FOOD ITEM-----------------
                        Text(
                            food.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // PRICE OF FOOD ITEM------------------
                        Text(
                            '\$' +  food.price.toString(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary
                          ),
                        ),

                        const SizedBox(height: 11),

                        // DESCRIPTION OF FOOD ITEM------------
                        Text(food.description),
                      ],
                    )
                ),

                const SizedBox(width: 10),
                // FOOD IMAGE---------
                Image.asset(
                    food.imagePath,
                  height: 110,
                  width: 110,
                ),
              ],
            ),
          ),
        ),
        Divider(
            color: Theme.of(context).colorScheme.inversePrimary,
          endIndent: 20,
          indent: 20,
        ),
      ],
    );
  }
}
