import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/common/custom_confirmation_dialog.dart';
import '../widgets/selected_grade/grade_card.dart';

class SelectGradeScreen extends StatelessWidget {
  const SelectGradeScreen({super.key});

  Future<void> _saveGrade(
      BuildContext context, int grade, String gradeName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('grade', grade);

    // رسالة تأكيد
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (ctx) => CustomConfirmationDialog(
        title: "تأكيد الاختيار",
        content: "هل أنت متأكد أنك في $gradeName؟",
        onCancel: () => Navigator.pop(ctx),
        onConfirm: () {
          Navigator.pop(ctx);
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اختر الصف الدراسي"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2196F3), // أزرق
              Colors.white, // أبيض
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
                onTap: () => _saveGrade(context, 1, "الصف الأول الثانوي"),
              ),
              GradeCard(
                title: "الصف الثاني الثانوي",
                subtitle: "مستوى أكثر تقدمًا",
                color: Colors.green,
                onTap: () => _saveGrade(context, 2, "الصف الثاني الثانوي"),
              ),
              GradeCard(
                title: "الصف الثالث الثانوي",
                subtitle: "سنة التحدي والنجاح",
                color: Colors.deepOrange,
                onTap: () => _saveGrade(context, 3, "الصف الثالث الثانوي"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
