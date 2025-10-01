import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/cubit/dashboard/profile/profile_cubit.dart';
import 'package:mister_app/cubit/dashboard/profile/profile_state.dart';
import 'package:mister_app/widgets/common/custom_appbare.dart';
import 'package:mister_app/widgets/profile/info_tile.dart';
import 'package:mister_app/widgets/profile/profile_avatar.dart';
import 'package:mister_app/widgets/profile/profile_buttons.dart';
import 'package:mister_app/widgets/profile/update_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const CustomAppbare(title: "Profile"),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      SizedBox(width: 16.w),
                      Text(
                        "Updating profile...",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is UpdateProfileSuccess) {
            Navigator.pop(context); // يقفل Dialog التحميل
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.green.shade50,
                title: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 8.w),
                    const Text("Success 🎉"),
                  ],
                ),
                content: Text(
                  "Profile updated successfully ✅",
                  style: TextStyle(fontSize: 16.sp),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is UpdateProfileError) {
            Navigator.pop(context); // يقفل Dialog التحميل
            Navigator.pop(context);
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
                    const Text("Error ❌"),
                  ],
                ),
                content: Text(
                  state.message,
                  style: TextStyle(fontSize: 16.sp),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileSuccess || state is UpdateProfileSuccess) {
            final user = state is ProfileSuccess
                ? state.user
                : (state as UpdateProfileSuccess).user;

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
                  const InfoTile(
                      icon: Icons.class_, title: "Stage", value: "ثانوي"),
                  SizedBox(height: 30.h),
                  ProfileButtons(
                    onUpdate: () {
                      showUpdateDialog(
                        context,
                        cubit.nameController,
                        cubit.emailController,
                        cubit.subjectController,
                        cubit.semesterController,
                        onPressed: () {
                          ProfileCubit.get(context).updateProfile(
                            name: cubit.nameController.text,
                            email: cubit.emailController.text,
                            subject: cubit.subjectController.text,
                            semester: cubit.semesterController.text,
                          );
                        },
                      );
                    },
                    onLogout: () => cubit.logout(context),
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
