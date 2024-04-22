import 'package:flutter/material.dart';

class OrderReceipt extends StatelessWidget{
  const OrderReceipt({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left:25, right:25, bottom: 25),
      child: Column(
        children: [
          Text("Thank you for your order, your DishDasher is on the way!"),
          Container(
            child: Text("Order Details"),
          ),
        ],
      ),
    );
  }
}