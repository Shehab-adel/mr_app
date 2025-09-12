import 'package:flutter/material.dart';
import 'package:mister_app/widgets/register/register_button.dart';
import 'package:mister_app/widgets/register/register_footer.dart';
import 'package:mister_app/widgets/register/register_form.dart';
import 'package:mister_app/widgets/register/register_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            // الخلفية (نص أزرق ونص أبيض)
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                    child: const Center(child: RegisterHeader()),
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
              top: size.height * 0.28,
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
                    RegisterForm(),

                    SizedBox(height: 20),

                    // Sign up button
                    RegisterButton(),
                    SizedBox(height: 15),

                    // Already have account
                    RegisterFooter()
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
