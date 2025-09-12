import 'package:flutter/material.dart';

import '../common/custom_textfield.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Create an account",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        CustomTextField(label: "Full Name"),
        SizedBox(height: 15),
        CustomTextField(label: "Email"),
        SizedBox(height: 15),
        CustomTextField(label: "Password", obscureText: true),
        SizedBox(height: 15),
        CustomTextField(label: "Confirm password", obscureText: true),
      ],
    );
  }
}
