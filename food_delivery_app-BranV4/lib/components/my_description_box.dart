import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('\$4.99'),
              Text(
                  'Delivery Fee',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text('15-25 min'),
              Text(
                  'Delivery Time',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
