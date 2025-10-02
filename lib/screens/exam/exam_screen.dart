import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/utils/app_routes.dart';
import 'package:mister_app/widgets/common/custom_appbare.dart';

/// 🔹 Dialog مخصص لإعادة الاستخدام (Responsive)
class ExitExamDialog extends StatelessWidget {
  const ExitExamDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r), // 👈 responsive
      ),
      backgroundColor: Colors.white,
      titlePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      actionsPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      title: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
            size: 28.sp, // 👈 responsive
          ),
          SizedBox(width: 8.w),
          Text(
            "End Exam",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp, // 👈 responsive
              color: Colors.black87,
            ),
          ),
        ],
      ),
      content: Text(
        "Do you want to end the exam and return to the home page?",
        style: TextStyle(
          fontSize: 16.sp, // 👈 responsive
          color: Colors.black87,
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        SizedBox(
          height: 40.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r), // 👈 responsive
              ),
            ),
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: 14.sp, // 👈 responsive
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r), // 👈 responsive
              ),
            ),
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              "Ok",
              style: TextStyle(
                fontSize: 14.sp, // 👈 responsive
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  late Timer _timer;
  int _seconds = 60 * 59; // 59 دقيقة
  bool _showTimer = true; // 👈 للتحكم في إظهار/إخفاء العداد
  String? selectedOption;

  String _formatTime(int seconds) {
    int h = seconds ~/ 3600;
    int m = (seconds % 3600) ~/ 60;
    int s = seconds % 60;
    return "${h.toString().padLeft(2, '0')}:"
        "${m.toString().padLeft(2, '0')}:"
        "${s.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() => _seconds--);
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<bool> _confirmExit() async {
    bool? confirmExit = await showDialog(
      context: context,
      builder: (context) => const ExitExamDialog(),
    );

    if (confirmExit == true) {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _confirmExit,
      child: Scaffold(
        appBar: CustomAppbare(
          title: 'Exam',
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 25.w),
              icon: Icon(
                _showTimer ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _showTimer = !_showTimer;
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_showTimer)
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      _formatTime(_seconds),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 30.h),
              Text(
                "What is the synonym of the word “attend”?",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: Column(
                  children: [
                    _buildOption("avoid"),
                    _buildOption("prefer"),
                    _buildOption("go"),
                    _buildOption("argue"),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: () async {
                    bool confirmExit = await _confirmExit();
                    if (confirmExit) {
                      // ✅ تم الانتقال بالفعل في _confirmExit
                    }
                  },
                  child: Text(
                    "END EXAM",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(String text) {
    return RadioListTile<String>(
      title: Text(
        text,
        style: TextStyle(fontSize: 16.sp),
      ),
      value: text,
      groupValue: selectedOption,
      onChanged: (val) {
        setState(() {
          selectedOption = val;
        });
      },
      activeColor: Colors.blue,
    );
  }
}
