import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showUpdateDialog(
  BuildContext context,
  String currentName,
  String currentEmail,
  String currentSubject,
  String currentSemester,
  Function(String, String, String, String) onSave,
) {
  final nameController = TextEditingController(text: currentName);
  final emailController = TextEditingController(text: currentEmail);
  final subjectController = TextEditingController(text: currentSubject);
  final semesterController = TextEditingController(text: currentSemester);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      title: const Text("Update Profile"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField(nameController, "Name", Icons.person),
            _buildTextField(emailController, "Email", Icons.email),
            _buildTextField(subjectController, "Subject", Icons.book),
            _buildTextField(semesterController, "Semester", Icons.school),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onPressed: () {
            onSave(
              nameController.text,
              emailController.text,
              subjectController.text,
              semesterController.text,
            );
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    ),
  );
}

Widget _buildTextField(
    TextEditingController controller, String hint, IconData icon) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.h),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blue),
        labelText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
  );
}
