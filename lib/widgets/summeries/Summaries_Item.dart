// lib/widgets/summaries/summaries_item.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mister_app/screens/summeries/Pdf_Viewer_Screen.dart';
import 'package:open_filex/open_filex.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class SummariesItem extends StatelessWidget {
  final String title;
  final String url;

  const SummariesItem({
    super.key,
    required this.title,
    required this.url,
  });

  Future<String> downloadFile(String url, String fileName) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/$fileName");
      await file.writeAsBytes(response.bodyBytes);
      return file.path;
    } else {
      throw Exception("فشل التحميل");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16.sp),
          ),
          Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  try {
                    final filePath = await downloadFile(url, "$title.pdf");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PdfViewerScreen(filePath: filePath),
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("خطأ في المعاينة: $e")),
                    );
                  }
                },
                child: Text("Preview", style: TextStyle(fontSize: 14.sp)),
              ),
              SizedBox(width: 8.w),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  try {
                    final filePath = await downloadFile(url, "$title.pdf");
                    await OpenFilex.open(filePath);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("خطأ في التحميل: $e")),
                    );
                  }
                },
                child: Text("Download", style: TextStyle(fontSize: 14.sp)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
