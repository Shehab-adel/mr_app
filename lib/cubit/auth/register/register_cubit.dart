import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mister_app/cubit/auth/register/register_state.dart';
import 'package:mister_app/services/auth_service.dart';
import 'package:mister_app/widgets/common/custom_confirmation_dialog.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._service) : super(RegisterInitial());

  final AuthService _service;

  static RegisterCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> registerUser() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());

      try {
        final user = await _service.registerUser(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        emit(RegisterSuccess(user));
      } catch (e) {
        emit(RegisterError(
          e.toString().replaceFirst("Exception: ", ""),
        ));
      }
    }
  }

  // ✅ دالة تحديث بيانات الدراسة
  Future<void> updateStudyInfo(String semester) async {
    emit(UpdateStudyInfoLoading());
    try {
      final user = await _service.updateStudyInfo(semester);
      emit(UpdateStudyInfoSuccess(user));
    } catch (e) {
      emit(UpdateStudyInfoError(
        e.toString().replaceFirst("Exception: ", ""),
      ));
    }
  }

  void confirmSemester(
      BuildContext context, String semester, String gradeName) {
    showDialog(
      context: context,
      builder: (ctx) => CustomConfirmationDialog(
        title: "تأكيد الاختيار",
        content: "هل أنت متأكد أنك في $gradeName؟",
        onCancel: () => Navigator.pop(ctx),
        onConfirm: () {
          Navigator.pop(ctx);
          RegisterCubit.get(context).updateStudyInfo(semester);
        },
      ),
    );
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
