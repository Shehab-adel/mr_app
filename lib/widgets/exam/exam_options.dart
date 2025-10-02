import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamOptions extends StatelessWidget {
  final String? selectedOption;
  final ValueChanged<String?> onChanged;
  const ExamOptions({
    super.key,
    required this.selectedOption,
    required this.onChanged,
  });

  Widget _buildOption(String text) {
    return RadioListTile<String>(
      title: Text(
        text,
        style: TextStyle(fontSize: 16.sp),
      ),
      value: text,
      groupValue: selectedOption,
      onChanged: onChanged,
      activeColor: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildOption("avoid"),
        _buildOption("prefer"),
        _buildOption("go"),
        _buildOption("argue"),
      ],
    );
  }
}
