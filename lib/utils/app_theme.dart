import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      // النص العادي (قبل ما الفيلد يتحدد)
      labelStyle: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 14,
      ),

      // النص العائم (لما الفيلد يتحدد ويطلع فوق)
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
