import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsList extends StatelessWidget {
  final List<Map<String, dynamic>> methods;
  final String? selectedMethod;
  final ValueChanged<String?> onChanged;

  const PaymentMethodsList({
    super.key,
    required this.methods,
    required this.selectedMethod,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: methods.map((method) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: method['color'].withOpacity(0.6),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: RadioListTile<String>(
            value: method['label'],
            groupValue: selectedMethod,
            onChanged: onChanged,
            title: Text(
              method['label'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: method['color'],
              ),
            ),
            secondary: Icon(method['icon'], color: method['color']),
          ),
        );
      }).toList(),
    );
  }
}
