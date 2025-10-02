import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamTitle extends StatelessWidget {
  const ExamTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Exam",
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }
}
