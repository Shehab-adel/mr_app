import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/cubit/auth/register/register_cubit.dart';
import 'package:mister_app/cubit/auth/register/register_state.dart';
import 'package:mister_app/utils/app_routes.dart';
import '../widgets/selected_grade/grade_card.dart';

class SelectGradeScreen extends StatelessWidget {
  const SelectGradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اختر الصف الدراسي"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if (state is UpdateStudyInfoLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      SizedBox(width: 16.w),
                      Text(
                        "Saving your study info...",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          // ✅ Success State
          else if (state is UpdateStudyInfoSuccess) {
            Navigator.pop(context); // يقفل Dialog التحميل
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.green.shade50,
                title: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 8.w),
                    const Text("Success 🎉"),
                  ],
                ),
                content: Text(
                  "Study info saved successfully ✅",
                  style: TextStyle(fontSize: 16.sp),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // يقفل الـ Dialog
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.home); // يروح للهوم
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          // ❌ Error State
          else if (state is UpdateStudyInfoError) {
            Navigator.pop(context); // يقفل Dialog التحميل
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.red.shade50,
                title: Row(
                  children: [
                    const Icon(Icons.error, color: Colors.red),
                    SizedBox(width: 8.w),
                    const Text("Error ❌"),
                  ],
                ),
                content: Text(
                  state.message,
                  style: TextStyle(fontSize: 16.sp),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF2196F3),
                  Colors.white,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradeCard(
                    title: "الصف الأول الثانوي",
                    subtitle: "ابدأ رحلتك من هنا",
                    color: Colors.blue,
                    onTap: () => RegisterCubit.get(context).confirmSemester(
                        context, "الأول", "الصف الأول الثانوي"),
                  ),
                  GradeCard(
                    title: "الصف الثاني الثانوي",
                    subtitle: "مستوى أكثر تقدمًا",
                    color: Colors.green,
                    onTap: () => RegisterCubit.get(context).confirmSemester(
                        context, "الثاني", "الصف الثاني الثانوي"),
                  ),
                  GradeCard(
                    title: "الصف الثالث الثانوي",
                    subtitle: "سنة التحدي والنجاح",
                    color: Colors.deepOrange,
                    onTap: () => RegisterCubit.get(context).confirmSemester(
                        context, "الثالث", "الصف الثالث الثانوي"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
