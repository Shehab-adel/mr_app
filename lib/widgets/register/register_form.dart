import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/cubit/auth/register_cubit.dart';
import '../../widgets/common/custom_textfield.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.get(context);

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          Text(
            "Create an account",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),

          /// Full Name
          CustomTextField(
            controller: cubit.nameController,
            label: "Full Name",
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Full name is required";
              }
              return null;
            },
          ),
          SizedBox(height: 15.h),

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
              if (value.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
          ),
          SizedBox(height: 15.h),

          /// Confirm Password
          CustomTextField(
            controller: cubit.confirmPasswordController,
            label: "Confirm password",
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Please confirm your password";
              }
              if (value != cubit.passwordController.text) {
                return "Passwords do not match";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
