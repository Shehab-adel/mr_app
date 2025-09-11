import 'package:flutter/material.dart';
import 'package:mister_app/widgets/login/login_button.dart';
import 'package:mister_app/widgets/login/login_text_fields.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Forgot Password
        const Text(
          "Forgot password?",
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 20),
        // Don't have an account? Sign Up
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Sign up",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Continue as Guest
        const Text(
          "Continue as Guest",
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),

        // Forgot Password
      ],
    );
  }
}
