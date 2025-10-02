import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamTimer extends StatelessWidget {
  const ExamTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "00:59:00",
      style: TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
