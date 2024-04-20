import 'package:dishdash/components/my_button.dart';
import 'package:flutter/material.dart';
import '../models/food.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key, required this.food});

  final Food food;

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // FOOD IMAGE----------
            Image.asset(widget.food.imagePath),
        
            // FOOD DATA-----------
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
        
                  // FOOD NAME-------------
                  Text(
                    widget.food.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
        
                  // FOOD PRICE----------
                  Text(
                    '\$' + widget.food.price.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: Theme.of(context).colorScheme.secondary
                    ),
                  ),
        
                  SizedBox(height: 20),
        
                  // FOOD DESCRIPTION---------
                  Text(
                    widget.food.description,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
        
                  SizedBox(height: 50),
        
                  // DIVIDER - put addons above divider if doing
                  Divider(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    endIndent: 20,
                    indent: 20,
                  ),
        
                  SizedBox(height: 10),
        
                  // BUTTON -> ADD TO CART----------
                  MyButton(
                      text: 'Add To Cart',
                      onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
