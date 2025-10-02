import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/widgets/common/custom_appbare.dart';
import 'package:mister_app/widgets/start_exam/exam_button.dart';
import 'package:mister_app/widgets/start_exam/exam_timer.dart';
import 'package:mister_app/widgets/start_exam/exam_title.dart';
import 'package:mister_app/widgets/start_exam/exam_total_questions.dart';

class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbare(title: "Start Exam"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 60.h),
          const ExamTitle(),
          SizedBox(height: 20.h),
          const ExamTimer(),
          SizedBox(height: 12.h),
          const ExamTotalQuestions(),
          const Spacer(),
          const ExamButton(),
        ],
      ),
    );
  }
}
