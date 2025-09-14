import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/custom_textfield.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Create an account",
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.h),
        const CustomTextField(label: "Full Name"),
        SizedBox(height: 15.h),
        const CustomTextField(label: "Email"),
        SizedBox(height: 15.h),
        const CustomTextField(label: "Password", obscureText: true),
        SizedBox(height: 15.h),
        const CustomTextField(label: "Confirm password", obscureText: true),
      ],
    );
  }
}
