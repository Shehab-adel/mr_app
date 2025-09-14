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
      body: Container(
        height: size.height,
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
          ),
        ),
      ),
    );
  }
}
