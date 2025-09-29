import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/cubit/auth/signin/signin_cubit.dart';
import 'package:mister_app/cubit/auth/signin/signin_state.dart';
import 'package:mister_app/utils/app_routes.dart';
import 'package:mister_app/widgets/signin/signin_button.dart';
import 'package:mister_app/widgets/signin/signin_footer.dart';
import 'package:mister_app/widgets/signin/signin_form.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

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
                child: BlocConsumer<SigninCubit, SigninState>(
                  listener: (context, state) {
                    if (state is SigninLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible:
                            false, // عشان المستخدم مايقفلش الديلوج
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.r),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const CircularProgressIndicator(),
                                SizedBox(width: 16.w),
                                const Text(
                                  "Signing in...",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }

                    if (state is SigninSuccess) {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.selectGrade,
                      );
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          backgroundColor: Colors.green.shade50,
                          title: Row(
                            children: [
                              const Icon(Icons.check_circle,
                                  color: Colors.green),
                              SizedBox(width: 8.w),
                              const Text("Welcome 🎉"),
                            ],
                          ),
                          content: const Text(
                            "Welcome back! We're happy to see you again.",
                            style: TextStyle(fontSize: 16),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "OK",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (state is SigninError) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: Colors.red.shade50,
                          title: Row(
                            children: [
                              const Icon(Icons.error, color: Colors.red),
                              SizedBox(width: 8.w),
                              const Text("Signin Failed ❌"),
                            ],
                          ),
                          content: Text(
                            state.message,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "OK",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SigninForm(),

                          const SigninButton(),

                          /// Signin Button

                          SizedBox(height: 12.h),

                          /// Forgot Password
                          const SigninFooter()
                        ],
                      ),
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}
