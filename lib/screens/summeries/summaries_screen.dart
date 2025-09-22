// lib/widgets/summaries/summaries_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/widgets/common/custom_appbare.dart';
import 'package:mister_app/widgets/summeries/Summaries_Section.dart';

class SummariesScreen extends StatelessWidget {
  const SummariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> units = [
      {
        "title": "Unit 1",
        "url": "https://www.africau.edu/images/default/sample.pdf"
      },
      {
        "title": "Unit 2",
        "url":
            "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf"
      },
    ];

    final List<Map<String, String>> chapters = [
      {
        "title": "Chapter 1",
        "url": "https://www.africau.edu/images/default/sample.pdf"
      },
      {
        "title": "Chapter 2",
        "url":
            "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppbare(title: "Summaries"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SummariesSection(title: "Units", items: units),
            SummariesSection(title: "Chapters", items: chapters),
          ],
        ),
      ),
    );
  }
}
