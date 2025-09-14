import 'package:flutter/material.dart';

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

  void _confirmPayment() {
    if (_selectedGrade == null || _selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("من فضلك اختر الصف الدراسي ووسيلة الدفع"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "تأكيد الدفع",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        content: Text(
          "لقد اخترت $_selectedGrade.\nوسيلة الدفع: $_selectedPaymentMethod.\nيرجى إتمام الدفع وسيتم التفعيل بعد تأكيد المدرس.",
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("إلغاء", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: const Text("تأكيد الدفع"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2196F3), Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "إتمام عملية الدفع",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // اختيار الصف
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: "اختر الصف الدراسي",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      value: _selectedGrade,
                      items: grades.map((grade) {
                        return DropdownMenuItem<String>(
                          value: grade,
                          child: Text(grade),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGrade = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    // اختيار وسيلة الدفع
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "اختر وسيلة الدفع:",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: paymentMethods.map((method) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: method['color'].withOpacity(0.6),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: RadioListTile<String>(
                            value: method['label'],
                            groupValue: _selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                _selectedPaymentMethod = value;
                              });
                            },
                            title: Text(
                              method['label'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: method['color'],
                              ),
                            ),
                            secondary:
                                Icon(method['icon'], color: method['color']),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),

                    // زر الدفع
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _confirmPayment,
                      child: const Text(
                        "إتمام الدفع",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
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
