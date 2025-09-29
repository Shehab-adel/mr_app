import 'package:mister_app/models/user_auth_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserAuthModel user;
  RegisterSuccess(this.user);
}

class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}

/// ✅ ستايتس خاصة بتحديث بيانات الدراسة
class UpdateStudyInfoLoading extends RegisterState {}

class UpdateStudyInfoSuccess extends RegisterState {
  final UserAuthModel user;
  UpdateStudyInfoSuccess(this.user);
}

class UpdateStudyInfoError extends RegisterState {
  final String message;
  UpdateStudyInfoError(this.message);
}
