import 'package:dishdash/components/my_button.dart';
import 'package:dishdash/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';

class FoodScreen extends StatefulWidget {
  final Food food;

  final Map<Addon, bool> selectedAddons = {};

  FoodScreen({super.key, 
  required this.food}){
    for(Addon addon in food.availableAddons){
      selectedAddons[addon] = false;
    }
  }


  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {

  //add to cart function
  void addToCart(Food food, Map<Addon, bool> selectedAddons){
    //close food screen and back to menu
    Navigator.pop(context);
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons){
      if(widget.selectedAddons[addon]==true){
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  
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
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount:widget.food.availableAddons.length,
                    itemBuilder: (context, index){
                      Addon addon= widget.food.availableAddons[index];

                      return CheckboxListTile(
                        title: Text(addon.name),
                        subtitle: Text(addon.price.toString()),
                        value: widget.selectedAddons[addon] ?? false,
                        onChanged: (bool? value) {
                              setState(() {
                                 widget.selectedAddons[addon] = value ?? false; // Update the state when the checkbox is toggled
                            });
      }
    );
  },
),

                  SizedBox(height: 10),
        
                  // BUTTON -> ADD TO CART----------
                  MyButton(
                      text: 'Add To Cart',
                      onTap: () => addToCart(widget.food, widget.selectedAddons),
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
