import 'package:flutter/material.dart';

class ForgetForm extends StatelessWidget {
  const ForgetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelText: "Email Address",
        prefixIcon: Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
