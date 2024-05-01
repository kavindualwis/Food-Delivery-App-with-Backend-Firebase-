import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/services/auth/login_or_register.dart.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in

          if (snapshot.hasData) {
            return const Homepage();
          }
          //user not logged in
          else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
