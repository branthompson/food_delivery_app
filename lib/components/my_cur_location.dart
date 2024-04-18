import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});


  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Your Location'),
          content: const TextField(
            decoration: InputDecoration(
                hintText: "Search Address..."),
          ),
          actions: [
            MaterialButton(
                onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Save'),
            ),
          ],
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Deliver Now',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                // ADDRESS
                Text(
                    '1234 Fake Address St.',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // DROP DOWN MENU
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
