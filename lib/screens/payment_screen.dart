import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/payment/grade_dropdown.dart';
import '../widgets/payment/pay_button.dart';
import '../widgets/payment/payment_methods_list.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? _selectedGrade;
  String? _selectedPaymentMethod;

  final List<String> grades = [
    "الصف الأول الثانوي",
    "الصف الثاني الثانوي",
    "الصف الثالث الثانوي",
  ];

  final List<Map<String, dynamic>> paymentMethods = [
    {"label": "فودافون كاش", "icon": Icons.phone_android, "color": Colors.red},
    {"label": "وي كاش", "icon": Icons.wifi, "color": Colors.purple},
    {"label": "اتصالات كاش", "icon": Icons.call, "color": Colors.green},
    {"label": "بطاقة بنكية", "icon": Icons.credit_card, "color": Colors.blue},
  ];

  /// فتح API الدفع
  Future<void> _goToPaymentApi() async {
    if (_selectedGrade == null || _selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("من فضلك اختر الصف الدراسي ووسيلة الدفع"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    String apiUrl = "";

    switch (_selectedPaymentMethod) {
      case "فودافون كاش":
        apiUrl = "https://example.com/api/payment/vodafone";
        break;
      case "وي كاش":
        apiUrl = "https://example.com/api/payment/we";
        break;
      case "اتصالات كاش":
        apiUrl = "https://example.com/api/payment/etisalat";
        break;
      case "بطاقة بنكية":
        apiUrl = "https://example.com/api/payment/card";
        break;
    }

    try {
      final uri = Uri.parse(apiUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw "تعذر فتح صفحة الدفع";
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw, // العرض 100%
        height: 1.sh, // الطول 100%
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2196F3), Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw), // 5% من العرض
            child: Container(
              width: 0.9.sw, // 90% من العرض
              padding: EdgeInsets.all(0.05.sw), // 5% من العرض
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.r,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "إتمام عملية الدفع",
                      style: TextStyle(
                        fontSize: 20.sp, // مقاس الخط متجاوب
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 0.02.sh),

                    /// اختيار الصف
                    GradeDropdown(
                      grades: grades,
                      selectedGrade: _selectedGrade,
                      onChanged: (value) {
                        setState(() => _selectedGrade = value);
                      },
                    ),
                    SizedBox(height: 0.02.sh),

                    /// اختيار وسيلة الدفع
                    PaymentMethodsList(
                      methods: paymentMethods,
                      selectedMethod: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() => _selectedPaymentMethod = value);
                      },
                    ),
                    SizedBox(height: 0.03.sh),

                    /// زر الدفع
                    PayButton(onPressed: _goToPaymentApi),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
