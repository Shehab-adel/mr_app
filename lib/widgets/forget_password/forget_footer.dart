import 'package:flutter/material.dart';

class ForgetFooter extends StatelessWidget {
  const ForgetFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Text(
        "Back to Login",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
