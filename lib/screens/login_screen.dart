import 'package:flutter/material.dart';
import 'package:mister_app/widgets/login/login_button.dart';
import 'package:mister_app/widgets/login/login_footer.dart';
import 'package:mister_app/widgets/login/login_header.dart';
import 'package:mister_app/widgets/login/login_text_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false, // يمنع تحريك الشاشة مع الكيبورد
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            // الخلفية (نص أزرق ونص أبيض)
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                    child: const Center(
                      child: LoginHeader(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(color: Colors.white),
                ),
              ],
            ),

            // الكارد (الفورم)
            Positioned(
              top: height * 0.28, // نسبة بدل رقم ثابت
              left: width * 0.05, // نسبة (5% من العرض)
              right: width * 0.05,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: height * 0.025,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.05),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: width * 0.04,
                      offset: Offset(0, height * 0.005),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoginTextFields(),
                    SizedBox(height: 20),
                    LoginButton(),
                    SizedBox(height: 12),
                    LoginFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
