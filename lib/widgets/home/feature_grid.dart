import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/utils/app_routes.dart';
import 'feature_card.dart';

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
        childAspectRatio: 2.3,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          FeatureCard(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.plylist);
              },
              icon: Icons.play_circle_fill,
              title: "Videos",
              color: Colors.red),
          FeatureCard(
              onTap: () {
                Navigator.pushNamed(context, 'AppRoutes.summaries');
              },
              icon: Icons.notes,
              title: "Summaries",
              color: Colors.blue),
          FeatureCard(
              onTap: () {
                Navigator.pushNamed(context, 'AppRoutes.questionBank');
              },
              icon: Icons.help_outline,
              title: "Question Bank",
              color: Colors.green),
          FeatureCard(
              onTap: () {
                Navigator.pushNamed(context, 'AppRoutes.exams');
              },
              icon: Icons.grade,
              title: "Exams",
              color: Colors.deepPurple),
        ],
      ),
    );
  }
}
