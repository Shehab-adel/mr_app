// lib/widgets/summaries/summaries_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/widgets/summeries/Summaries_Item.dart';

class SummariesSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;

  const SummariesSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        ...items.map((item) {
          return SummariesItem(
            title: item["title"]!,
            url: item["url"]!,
          );
        }),
        SizedBox(height: 24.h),
      ],
    );
  }
}
