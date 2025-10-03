import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/cubit/auth/signin/signin_cubit.dart';
import 'package:mister_app/cubit/auth/signin/signin_state.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundImage: const AssetImage("assets/images/avatar.png"),
          ),
          SizedBox(width: 12.w),

          /// نستخدم BlocBuilder عشان نجيب بيانات المستخدم
          BlocBuilder<SigninCubit, SigninState>(
            builder: (context, state) {
              String name = "User"; // default
              if (state is SigninSuccess) {
                name = state.user.name; // ✅ من الـ state مش من cubit
              }

              return Text(
                name,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
