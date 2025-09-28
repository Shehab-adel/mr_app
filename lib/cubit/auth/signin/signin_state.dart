import 'package:mister_app/models/user_model.dart';

abstract class SigninState {}

class SigninInatial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final UserModel user;
  SigninSuccess(this.user);
}

class SigninError extends SigninState {
  final String message;
  SigninError(this.message);
}
