import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/custom_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Email
        const CustomTextField(label: "Email"),
        SizedBox(height: 15.h),

        /// Password
        const CustomTextField(label: "Password", obscureText: true),
        SizedBox(height: 20.h),
      ],
    );
  }
}
