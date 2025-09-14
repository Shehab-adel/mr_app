import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PayButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.8.sw, // 80% من عرض الشاشة
      height: 0.07.sh, // 7% من ارتفاع الشاشة
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r), // متجاوب
          ),
          elevation: 5,
          padding: EdgeInsets.symmetric(
            vertical: 12.h, // متجاوب مع الارتفاع
            horizontal: 20.w, // متجاوب مع العرض
          ),
        ),
        child: Text(
          "ادفع الآن",
          style: TextStyle(
            fontSize: 18.sp, // الخط متجاوب
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
