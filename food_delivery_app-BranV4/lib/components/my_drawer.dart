import 'package:dishdash/services/auth/auth_page.dart';
import 'package:dishdash/components/my_drawer_tile.dart';
import 'package:dishdash/services/auth/auth_services.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout(){
    final authService=AuthService();
    authService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Icon(
                Icons.restaurant_menu_outlined,
              size: 70,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Divider(),
          ),
          MyDrawerTile(text: 'HOME', icon: Icons.home_filled, onTap: () => Navigator.pop(context)),
          MyDrawerTile(text: 'LOGOUT', icon: Icons.logout,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AuthPage()))),
        ],
      ),
    );
  }
}

