import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/cubit/dashboard/profile/profile_cubit.dart';
import 'package:mister_app/cubit/dashboard/profile/profile_state.dart';
import 'package:mister_app/widgets/common/custom_appbare.dart';
import 'package:mister_app/widgets/profile/info_tile.dart';
import 'package:mister_app/widgets/profile/profile_avatar.dart';
import 'package:mister_app/widgets/profile/profile_buttons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const CustomAppbare(title: "Profile"),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileSuccess) {
            final user = state.user;
            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  ProfileAvatar(name: user.name),
                  SizedBox(height: 20.h),
                  InfoTile(icon: Icons.person, title: "Name", value: user.name),
                  SizedBox(height: 14.h),
                  InfoTile(
                      icon: Icons.email, title: "Email", value: user.email),
                  SizedBox(height: 14.h),
                  InfoTile(
                      icon: Icons.book, title: "Subject", value: user.subject),
                  SizedBox(height: 14.h),
                  InfoTile(
                      icon: Icons.school,
                      title: "Semester",
                      value: user.semester),
                  SizedBox(height: 14.h),
                  InfoTile(
                      icon: Icons.class_, title: "Stage", value: user.stage),
                  SizedBox(height: 30.h),
                  ProfileButtons(
                    onUpdate: () {
                      // هنعمل update بعدين
                    },
                    onLogout: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
