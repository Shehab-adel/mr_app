import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/cubit/auth/signin/signin_cubit.dart';

import '../common/custom_textfield.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = SigninCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          /// Email
          CustomTextField(
            controller: cubit.emailController,
            label: "Email",
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Email is required";
              }
              // Regex للتحقق من صيغة الإيميل (اختياري)
              return null;
            },
          ),
          SizedBox(height: 15.h),

          /// Password
          CustomTextField(
            controller: cubit.passwordController,
            label: "Password",
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Password is required";
              }

              return null;
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
