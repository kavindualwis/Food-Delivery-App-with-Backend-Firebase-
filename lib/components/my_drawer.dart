import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_tile.dart';
import 'package:food_delivery_app/pages/about_us.dart';
import 'package:food_delivery_app/pages/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void signUserout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo

          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.food_bank,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(top: 10.0),
          //   child: LottieBuilder.network(
          //     'https://lottie.host/2dc5f485-0091-4a9e-b8bd-e20ba33ff9b7/CjmvrWLWHL.json',
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          //Home
          MyDrawerTile(
            icon: Icons.home,
            text: 'H o m e',
            ontap: () {
              Navigator.pop(context);
            },
          ),

          //settings list tile
          MyDrawerTile(
            icon: Icons.history,
            text: 'O r d e r  H i s t o r y',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          //Order History
          MyDrawerTile(
            icon: Icons.settings,
            text: 'S e t t i n g s',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          //settings list tile
          MyDrawerTile(
            icon: Icons.info,
            text: 'A b o u t  u s',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUs(),
                ),
              );
            },
          ),

          const Spacer(),

          //logout list tile
          MyDrawerTile(
            icon: Icons.logout_outlined,
            text: 'L o g o u t',
            ontap: signUserout,
          ),
        ],
      ),
    );
  }
}
