import 'package:flutter/material.dart';
import 'package:mister_app/widgets/forget_password/forget_form.dart';

import '../../widgets/forget_password/forget_button.dart';
import '../../widgets/forget_password/forget_footer.dart';
import '../../widgets/forget_password/forget_header.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            // الخلفية (نفس فكرة Signin/Register)
            Column(
              children: [
                Expanded(flex: 2, child: Container(color: Colors.blue)),
                Expanded(flex: 3, child: Container(color: Colors.white)),
              ],
            ),

            // الفورم
            Positioned(
              top: size.height * 0.25,
              left: 20,
              right: 20,
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
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ForgetHeader(),
                    SizedBox(height: 20),
                    ForgetForm(),
                    SizedBox(height: 20),
                    ForgetButton(),
                    SizedBox(height: 12),
                    ForgetFooter(),
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
