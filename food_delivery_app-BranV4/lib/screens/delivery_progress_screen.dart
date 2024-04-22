import "package:dishdash/components/order_receipt.dart";
import "package:flutter/material.dart";

class DeliveryProgressScreen extends StatelessWidget{
  const DeliveryProgressScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Delivery In Progress..."),
      backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          OrderReceipt()
        ],
      )
    );
  }

  
}