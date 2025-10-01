import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mister_app/cubit/auth/signin/signin_state.dart';
import 'package:mister_app/services/auth_service.dart';
import 'package:mister_app/utils/token_storage.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this._service) : super(SigninInatial());

  final AuthService _service;

  static SigninCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signinUser() async {
    if (formKey.currentState!.validate()) {
      emit(SigninLoading());

      try {
        final user = await _service.signinUser(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        await TokenStorage.saveToken(user.token);
        emit(SigninSuccess(user));
      } catch (e) {
        emit(SigninError(
          e.toString().replaceFirst("Exception: ", ""),
        ));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
