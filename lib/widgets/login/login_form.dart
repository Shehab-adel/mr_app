import 'package:flutter/material.dart';

import '../common/custom_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(label: "Email"),
        SizedBox(height: 15),
        CustomTextField(label: "Password", obscureText: true),
      ],
    );
  }
}
