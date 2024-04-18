import 'package:dishdash/components/my_app_bar.dart';
import 'package:dishdash/components/my_cur_location.dart';
import 'package:dishdash/components/my_description_box.dart';
import 'package:dishdash/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MyAppBar(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),

                  // Current Location
                  MyCurrentLocation(),

                  // Description Box
                  MyDescriptionBox(),
                ],
              ),
              title: Text('Title'),
          ),
        ],
        body: Container(color: Theme.of(context).colorScheme.background),
      ),
    );
  }
}
