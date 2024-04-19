import 'package:flutter/material.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  // List of food menu
  final List<Food> _menu = [
    // MAIN COURSE MENU-------------------------------------------------
    Food(
      name: 'Burger',
      description: 'A juicy beef patty sandwiched between a soft bun with fresh toppings.',
      imagePath: 'lib/images/main/burger.png',
      price: 4.99,
      category: FoodCategory.main,
    ),
    Food(
      name: 'Chicken',
      description: 'Tender and flavorful chicken pieces, perfectly cooked to juicy perfection.',
      imagePath: 'lib/images/main/chicken.png',
      price: 5.99,
      category: FoodCategory.main,
    ),
    Food(
      name: 'Pasta',
      description: 'Al dente pasta tossed in a rich and savory tomato or creamy sauce.',
      imagePath: 'lib/images/main/pasta.png',
      price: 7.99,
      category: FoodCategory.main,
    ),
    Food(
      name: 'Pizza',
      description: 'A classic Italian pie with a crispy crust, tangy sauce, and gooey melted cheese.',
      imagePath: 'lib/images/main/pizza.png',
      price: 6.99,
      category: FoodCategory.main,
    ),
    Food(
      name: 'Steak',
      description: 'A premium cut of beef, grilled to perfection and served with your choice of sides.',
      imagePath: 'lib/images/main/steak.png',
      price: 9.99,
      category: FoodCategory.main,
    ),

    // SIDE COURSE MENU-----------------------------------------
    Food(
      name: 'Fries',
      description: 'Crispy and golden-brown french fries, the perfect accompaniment to any meal.',
      imagePath: 'lib/images/side/fries.png',
      price: 1.99,
      category: FoodCategory.side,
    ),
    Food(
      name: 'Rice',
      description: 'Fluffy and steaming white rice, a classic and versatile side dish.',
      imagePath: 'lib/images/side/rice.png',
      price: 0.99,
      category: FoodCategory.side,
    ),
    Food(
      name: 'Rolls',
      description: 'Freshly baked rolls, warm and soft, perfect for soaking up sauces or spreading butter.',
      imagePath: 'lib/images/side/rolls.png',
      price: 2.99,
      category: FoodCategory.side,
    ),
    Food(
      name: 'Salad',
      description: 'A crisp and refreshing salad, made with fresh greens and your choice of toppings.',
      imagePath: 'lib/images/side/salad.png',
      price: 1.99,
      category: FoodCategory.side,
    ),
    Food(
      name: 'Soup',
      description: 'A piping hot and comforting soup, perfect for sipping on a chilly day.',
      imagePath: 'lib/images/side/soup.png',
      price: 1.99,
      category: FoodCategory.side,
    ),

    // DESSERT COURSE MENU--------------------------------------
    Food(
      name: 'Cake',
      description: 'A decadent and moist cake, layered with rich frosting and topped with delicious garnishes.',
      imagePath: 'lib/images/desert/cake.png',
      price: 3.99,
      category: FoodCategory.dessert,
    ),
    Food(
      name: 'Cookies',
      description: 'Freshly baked cookies, soft and chewy, with melt-in-your-mouth chocolate chips.',
      imagePath: 'lib/images/desert/cookies.png',
      price: 2.99,
      category: FoodCategory.dessert,
    ),
    Food(
      name: 'Fruit',
      description: 'A refreshing assortment of fresh, seasonal fruits, perfect for a healthy dessert.',
      imagePath: 'lib/images/desert/fruit.png',
      price: 1.99,
      category: FoodCategory.dessert,
    ),
    Food(
      name: 'Icecream',
      description: 'Rich and creamy ice cream, available in a variety of delicious flavors.',
      imagePath: 'lib/images/desert/icecream.png',
      price: 3.99,
      category: FoodCategory.dessert,
    ),
    Food(
      name: 'Milkshake',
      description: 'A thick and indulgent milkshake, blended with ice cream and your choice of flavors.',
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