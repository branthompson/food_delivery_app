import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.child, required this.title});

  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 325,
      collapsedHeight: 100,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_rounded),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      title: Text("Family Diner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}

