import 'package:flutter/material.dart';

class ForgetHeader extends StatelessWidget {
  const ForgetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Icon(Icons.lock_reset, size: 80, color: Colors.blue),
        SizedBox(height: 12),
        Text(
          "Forgot Password?",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          "Enter your email to reset your password",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
