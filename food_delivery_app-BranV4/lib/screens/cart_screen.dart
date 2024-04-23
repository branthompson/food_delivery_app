import 'package:dishdash/components/my_button.dart';
import 'package:dishdash/components/my_cart_section.dart';
import 'package:dishdash/models/restaurant.dart';
import 'package:dishdash/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        // Calculate the total price
        double totalPrice = userCart.fold(0, (sum, current) => sum + (current.food.price * current.quantity));

        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  restaurant.clearCart();
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final cartItem = userCart[index];
                    return MyCartSection(cartItem: cartItem);
                  },
                ),
              ),
              // Display total price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Price:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              // Checkout button
              MyButton(
                text: "Checkout",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const PaymentScreen())
                  );
                }
              ),
            ],
          )
        );
      }
    );
  }
}
