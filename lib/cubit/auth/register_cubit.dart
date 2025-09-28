import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mister_app/cubit/auth/register/register_state.dart';
import 'package:mister_app/services/auth_service.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._service) : super(RegisterInitial());

  final RegisterService _service;

  static RegisterCubit get(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());

      final result = await _service.registerUser(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      if (result["success"] == true) {
        emit(RegisterSuccess(result["data"]));
      } else {
        emit(RegisterError(result["message"] ?? "Unknown error"));
      }
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
