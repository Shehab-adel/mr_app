import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradeDropdown extends StatelessWidget {
  final List<String> grades;
  final String? selectedGrade;
  final ValueChanged<String?> onChanged;

  const GradeDropdown({
    super.key,
    required this.grades,
    required this.selectedGrade,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "اختر الصف الدراسي",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      initialValue: selectedGrade,
      items: grades.map((grade) {
        return DropdownMenuItem<String>(
          value: grade,
          child: Text(grade),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
