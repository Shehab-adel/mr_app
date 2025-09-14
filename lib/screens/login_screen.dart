import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/widgets/login/login_button.dart';
import 'package:mister_app/widgets/login/login_footer.dart';
import 'package:mister_app/widgets/login/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // يمنع تحريك الشاشة مع الكيبورد
      body: Container(
        height: 1.sh, // 100% من ارتفاع الشاشة
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2196F3), Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.r,
                    offset: Offset(0, 5.h),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LoginForm(),

                    const LoginButton(),

                    /// Login Button

                    SizedBox(height: 12.h),

                    /// Forgot Password
                    const LoginFooter()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
