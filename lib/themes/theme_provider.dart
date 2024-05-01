// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/themes/dark_mode.dart';
import 'package:food_delivery_app/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
    _saveThemePreference(themeData);
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }

  Future<void> _saveThemePreference(ThemeData themeData) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set({'darkMode': themeData == darkMode});
      }
    } catch (error) {
      print('Error saving theme preference: $error');
    }
  }

  Future<void> retrieveThemePreference() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final userData =
            await _firestore.collection('users').doc(user.uid).get();
        if (userData.exists) {
          final bool isDarkMode = userData.get('darkMode') ?? false;
          _themeData = isDarkMode ? darkMode : lightMode;
          notifyListeners();
        }
      }
    } catch (error) {
      print('Error retrieving theme preference: $error');
    }
  }
}
