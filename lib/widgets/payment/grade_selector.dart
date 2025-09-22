import 'package:flutter/material.dart';

class GradeSelector extends StatelessWidget {
  final String? selectedGrade;
  final ValueChanged<String?> onChanged;

  const GradeSelector({
    super.key,
    required this.selectedGrade,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedGrade,
      hint: const Text("اختر الصف"),
      items: const [
        DropdownMenuItem(value: "الصف الأول", child: Text("الصف الأول")),
        DropdownMenuItem(value: "الصف الثاني", child: Text("الصف الثاني")),
        DropdownMenuItem(value: "الصف الثالث", child: Text("الصف الثالث")),
      ],
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "الصف",
      ),
    );
  }
}
