import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/cubit/auth/register/register_cubit.dart';

void showUpdateDialog(
  BuildContext context,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController subjectController,
  TextEditingController semesterController, {
  void Function()? onPressed,
}) {
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
            buildSemesterDropdown(context, semesterController)
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey[700],
            textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          child: const Text("Cancel"),
        ),
        SizedBox(width: 12.w),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 2,
          ),
          onPressed: () {
            FocusScope.of(context).unfocus(); // يعمل sync قبل الحفظ
            onPressed?.call();
          },
          child: Text(
            "Save",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildTextField(
    TextEditingController controller, String hint, IconData icon) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.h),
    child: TextFormField(
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

/// 🔽 خاص بالـ Semester Dropdown
Widget buildSemesterDropdown(
    BuildContext context, TextEditingController semesterController) {
  return DropdownButtonFormField<String>(
    initialValue:
        semesterController.text.isNotEmpty ? semesterController.text : null,
    items: const [
      DropdownMenuItem(value: "الأول", child: Text("الأول")),
      DropdownMenuItem(value: "الثاني", child: Text("الثاني")),
      DropdownMenuItem(value: "الثالث", child: Text("الثالث")),
    ],
    onChanged: (value) {
      if (value != null) {
        RegisterCubit.get(context).updateStudyInfo(value);
      }
    },
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.school, color: Colors.blue),
      labelText: "Semester",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
