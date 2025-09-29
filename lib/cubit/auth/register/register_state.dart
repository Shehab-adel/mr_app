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
