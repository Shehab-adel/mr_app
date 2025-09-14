import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

        SizedBox(height: 10.h),
        // Login Button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.w),
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              "Login",
              style: TextStyle(color: Colors.blue, fontSize: 16.sp),
            ),
          ),
        ),
      ],
    );
  }
}
