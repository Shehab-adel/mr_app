import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final String name;
  const ProfileAvatar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 55.r,
      backgroundColor: Colors.blue.shade100,
      child: Icon(
        Icons.person,
        size: 65.sp,
        color: Colors.blue.shade700,
      ),
    );
  }
}
