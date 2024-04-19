import 'package:flutter/material.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{

  // List of food menu
  final List<Food> _menu = [

    // MAIN COURSE MENU-------------------------------------------------
    Food(name: 'Burger',
        description: 'Burger Description',
        imagePath: 'lib/images/main/burger.png',
        price: 4.99,
        category: FoodCategory.main,
    ),
    Food(name: 'Chicken',
      description: 'Chicken Description',
      imagePath: 'lib/images/main/chicken.png',
      price: 5.99,
      category: FoodCategory.main,
    ),
    Food(name: 'Pasta',
      description: 'Pasta Description',
      imagePath: 'lib/images/main/pasta.png',
      price: 7.99,
      category: FoodCategory.main,
    ),
    Food(name: 'Pizza',
      description: 'Pizza Description',
      imagePath: 'lib/images/main/pizza.png',
      price: 6.99,
      category: FoodCategory.main,
    ),
    Food(name: 'Steak',
      description: 'Steak Description',
      imagePath: 'lib/images/main/steak.png',
      price: 9.99,
      category: FoodCategory.main,
    ),

    // SIDE COURSE MENU-----------------------------------------
    Food(name: 'Fries',
      description: 'Fries Description',
      imagePath: 'lib/images/side/fries.png',
      price: 1.99,
      category: FoodCategory.side,
    ),
    Food(name: 'Rice',
      description: 'Rice Description',
      imagePath: 'lib/images/side/rice.png',
      price: 0.99,
      category: FoodCategory.side,
    ),
    Food(name: 'Rolls',
      description: 'Rolls Description',
      imagePath: 'lib/images/side/rolls.png',
      price: 2.99,
      category: FoodCategory.side,
    ),
    Food(name: 'Salad',
      description: 'Salad Description',
      imagePath: 'lib/images/side/salad.png',
      price: 1.99,
      category: FoodCategory.side,
    ),
    Food(name: 'Soup',
      description: 'Soup Description',
      imagePath: 'lib/images/side/soup.png',
      price: 1.99,
      category: FoodCategory.side,
    ),

    // DESERT COURSE MENU--------------------------------------
    Food(name: 'Cake',
      description: 'Cake Description',
      imagePath: 'lib/images/desert/cake.png',
      price: 3.99,
      category: FoodCategory.dessert,
    ),
    Food(name: 'Cookies',
      description: 'Cookies Description',
      imagePath: 'lib/images/desert/cookies.png',
      price: 2.99,
      category: FoodCategory.dessert,
    ),
    Food(name: 'Fruit',
      description: 'Fruit Description',
      imagePath: 'lib/images/desert/fruit.png',
      price: 1.99,
      category: FoodCategory.dessert,
    ),
    Food(name: 'Icecream',
      description: 'Cake Description',
      imagePath: 'lib/images/desert/icecream.png',
      price: 3.99,
      category: FoodCategory.dessert,
    ),
    Food(name: 'Milkshake',
      description: 'Cake Description',
      imagePath: 'lib/images/desert/milkshake.png',
      price: 3.99,
      category: FoodCategory.dessert,
    ),

  ];


  // GETTERS---------------------------------------

  List<Food> get menu => _menu;


  // OPERATIONS-------------------------------------

  // add to cart

  // remove from cart

  // get total price of cart

  // get total number of items in cart

  // clear the cart


  // HELPERS------------------------------------------

  // generate receipt (maybe we implement)

  // format double value into money




}