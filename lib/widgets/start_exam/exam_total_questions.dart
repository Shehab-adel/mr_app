import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamTotalQuestions extends StatelessWidget {
  const ExamTotalQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Total questions: 20",
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black54,
      ),
    );
  }
}
