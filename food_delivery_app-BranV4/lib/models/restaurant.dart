import 'package:collection/collection.dart';
import 'package:dishdash/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      availableAddons: [ 
        Addon(name:"Spicy Ketchup", price:0.50),
        Addon(name:"Mustard", price:0.50),
        Addon(name:"Mushrooms", price:1.20),
        Addon(name:"Extra Cheese", price:0.99)
      ] ,
    ),
    Food(
      name: 'Chicken',
      description: 'Tender and flavorful chicken pieces, perfectly cooked to juicy perfection.',
      imagePath: 'lib/images/main/chicken.png',
      price: 5.99,
      category: FoodCategory.main,
      availableAddons: [ 
        Addon(name:"Sauteed Onions", price:0.89),
        Addon(name:"Roasted Garlic", price:0.70),
        Addon(name: "Small Rice", price: 1.20)
      ] ,
    ),
    Food(
      name: 'Pasta',
      description: 'Al dente pasta tossed in a rich and savory tomato or creamy sauce.',
      imagePath: 'lib/images/main/pasta.png',
      price: 7.99,
      category: FoodCategory.main,
      availableAddons: [ 
        Addon(name:"Meatballs", price:2.50),
        Addon(name:"Grilled Chicken", price:2.00),
        Addon(name:"Cheese", price:1.20),
        Addon(name:"Garlic Bread", price:1.00)
      ] ,
    ),
    Food(
      name: 'Pizza',
      description: 'A classic Italian pie with a crispy crust, tangy sauce, and gooey melted cheese.',
      imagePath: 'lib/images/main/pizza.png',
      price: 6.99,
      category: FoodCategory.main,
      availableAddons: [ 
        Addon(name:"Extra Chesse", price:0.50),
        Addon(name:"Sausage", price:1.50),
        Addon(name:"Pepperoni", price:1.50),
        Addon(name:"Mushrooms", price:1.20),
        Addon(name: "Olives", price: 0.50),
        Addon(name: "Pineapple", price: 1.00)
      ] ,
    ),
    Food(
      name: 'Steak',
      description: 'A premium cut of beef, grilled to perfection and served with your choice of sides.',
      imagePath: 'lib/images/main/steak.png',
      price: 9.99,
      category: FoodCategory.main,
      availableAddons: [ 
        Addon(name:"Garlic Butter", price:0.50),
        Addon(name:"Sauteed Onions", price:0.80),
        Addon(name:"Steak Sauce", price:1.00),
      ] ,
    ),

    // SIDE COURSE MENU-----------------------------------------
    Food(
      name: 'Fries',
      description: 'Crispy and golden-brown french fries, the perfect accompaniment to any meal.',
      imagePath: 'lib/images/side/fries.png',
      price: 1.99,
      category: FoodCategory.side,
      availableAddons: [ 
        Addon(name:"Melted Cheese", price:0.50),
        Addon(name:"Bacon", price:1.00),
      ] ,
    ),
    Food(
      name: 'Rice',
      description: 'Fluffy and steaming white rice, a classic and versatile side dish.',
      imagePath: 'lib/images/side/rice.png',
      price: 0.99,
      category: FoodCategory.side,
      availableAddons: [ 
        Addon(name:"None", price:0.00),
      ] ,
    ),
    Food(
      name: 'Rolls',
      description: 'Freshly baked rolls, warm and soft, perfect for soaking up sauces or spreading butter.',
      imagePath: 'lib/images/side/rolls.png',
      price: 2.99,
      category: FoodCategory.side,
      availableAddons: [ 
        Addon(name:"Butter", price:0.50),
      ] ,
    ),
    Food(
      name: 'Salad',
      description: 'A crisp and refreshing salad, made with fresh greens and your choice of toppings.',
      imagePath: 'lib/images/side/salad.png',
      price: 1.99,
      category: FoodCategory.side,
      availableAddons: [ 
        Addon(name:"Fried Onions", price:0.50),
        Addon(name:"Chicken", price:1.50),
        Addon(name:"Bacon", price:1.10),
        Addon(name:"Extra Tomato", price:0.99),
        Addon(name: "Ranch Dressing", price: 0.20),
        Addon(name: "Italian Dressing", price: 0.20),
        Addon(name: "Olives", price: 1.00),
        Addon(name: "Egg", price: 0.05)
      ] ,
    ),
    Food(
      name: 'Soup',
      description: 'A piping hot and comforting soup, perfect for sipping on a chilly day.',
      imagePath: 'lib/images/side/soup.png',
      price: 1.99,
      category: FoodCategory.side,
      availableAddons: [ 
        Addon(name:"Hot Sauce", price:0.20),
        Addon(name:"Parmesam", price:0.20),
        Addon(name:"BreadStick", price:1.00),
      ] ,
    ),

    // DESSERT COURSE MENU--------------------------------------
    Food(
      name: 'Cake',
      description: 'A decadent and moist cake, layered with rich frosting and topped with delicious garnishes.',
      imagePath: 'lib/images/desert/cake.png',
      price: 3.99,
      category: FoodCategory.dessert,
      availableAddons: [ 
        Addon(name:"Chocolate Chips", price:0.50),
        Addon(name:"Strawberry Jam", price:0.50),
        Addon(name:"Caramel Drizzle", price:0.50),
      ] ,
    ),
    Food(
      name: 'Cookies',
      description: 'Freshly baked cookies, soft and chewy, with melt-in-your-mouth chocolate chips.',
      imagePath: 'lib/images/desert/cookies.png',
      price: 2.99,
      category: FoodCategory.dessert,
      availableAddons: [ 
        Addon(name:"Scoop of Ice Cream", price:1.00),
      ] ,
    ),
    Food(
      name: 'Fruit',
      description: 'A refreshing assortment of fresh, seasonal fruits, perfect for a healthy dessert.',
      imagePath: 'lib/images/desert/fruit.png',
      price: 1.99,
      category: FoodCategory.dessert,
      availableAddons: [ 
        Addon(name:"None", price:0.00),
      ] ,
    ),
    Food(
      name: 'Icecream',
      description: 'Rich and creamy ice cream, available in a variety of delicious flavors.',
      imagePath: 'lib/images/desert/icecream.png',
      price: 3.99,
      category: FoodCategory.dessert,
      availableAddons: [ 
        Addon(name:"Brownie Topping", price:0.50),
        Addon(name:"Chocolate Drizzle", price:0.50),
        Addon(name:"Strawberry Drizzle", price:0.50),
        Addon(name:"Caramel Drizzle", price:0.50),
        Addon(name: "Peanut Butter Cups", price: 0.50),
        Addon(name: "Whipped Cream", price: 0.50),
        Addon(name: "Cherry", price: 0.50)
      ] ,
    ),
    Food(
      name: 'Milkshake',
      description: 'A thick and indulgent milkshake, blended with ice cream and your choice of flavors.',
      imagePath: 'lib/images/desert/milkshake.png',
      price: 3.99,
      category: FoodCategory.dessert,
      availableAddons: [ 
        Addon(name:"Whipped Cream", price:0.50),
        Addon(name:"Cherry", price:0.50),
        Addon(name:"Chocolate Drizzle", price:1.20)
      ] ,
    ),
  ];

  // GETTERS---------------------------------------

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // OPERATIONS------------------------------------
  // 
  // user cart
  final List<CartItem> _cart = [];

  // add to cart

  void addToCart(Food food, List<Addon> selectedAddons){
    //see if there is already item in crt

    CartItem? cartItem= _cart.firstWhereOrNull((item){
      //check if the food item is the same
      bool isSameFood = item.food ==food;

      //check if list of selected addons are the same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if(cartItem != null){
      cartItem.quantity++;
    }

    //else, add new cart item to cart
    else{
      _cart.add(
        CartItem(food: food, 
        selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }


  // remove from cart
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);
    if(cartIndex != -1){
      if(_cart[cartIndex].quantity>1){
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }
    }
   notifyListeners();

  }

  // get total price of cart
  double getTotalPrice(){
    double total= 0.0;

    for(CartItem cartItem in _cart){
      double itemTotal=cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal +=addon.price;
      }
      total+= itemTotal *cartItem.quantity;

    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear the cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }




 

  // HELPERS------------------------------------------ 

  // generate receipt (maybe we implement)
  String displayOrder() {
    final orderReceipt = StringBuffer();
    orderReceipt.writeln("These dishes are headed your way.");
    orderReceipt.writeln();

    //format date of order
    String orderDate= DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());

    orderReceipt.writeln(orderDate);
    orderReceipt.writeln();
    orderReceipt.writeln();

    for (final cartItem in _cart){
      orderReceipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)} ");
   
    }
    orderReceipt.writeln();
    orderReceipt.writeln();
    orderReceipt.writeln("Total Price:  ${_formatPrice(getTotalPrice())}");

    return orderReceipt.toString();
  }

  // format double value into money
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }


  //summary of addons on order receipt
  String _formatAddons(List<Addon> addons){
    return addons
    .map((addon)=>"${addon.name} (${_formatPrice(addon.price)})")
    .join(", ");
  }
}