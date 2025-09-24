import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,

    // 👇 نخلي أي ProgressIndicator في التطبيق لونه أزرق
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.blue,
    ),

    // 👇 AppBar
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.blue,
      elevation: 0,
    ),

    // 👇 InputDecoration
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      labelStyle: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 14,
      ),
      floatingLabelStyle: const TextStyle(
        color: Colors.blue,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 108, 116, 122),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
