import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "Already have an account?",
            style: TextStyle(color: Colors.black54),
          ),
        ),

        const SizedBox(height: 10),
        // Login Button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
