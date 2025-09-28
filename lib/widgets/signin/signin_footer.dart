import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/utils/app_routes.dart';

class SigninFooter extends StatelessWidget {
  const SigninFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Forgot Password
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.forget);
          },
          child: Text(
            "Forgot password?",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),
        ),

        SizedBox(height: 20.h),

        /// Don't have an account?
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
        ),
        SizedBox(height: 20.h),

        /// Sign Up
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.register);
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              "Sign up",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),

        /// Continue as Guest
        Text(
          "Continue as Guest",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.sp,
          ),
        ),
        // Forgot Password
      ],
    );
  }
}
