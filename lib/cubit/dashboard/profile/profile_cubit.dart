import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mister_app/cubit/auth/signin/signin_cubit.dart';
import 'package:mister_app/cubit/dashboard/profile/profile_state.dart';
import 'package:mister_app/models/user_profile_model.dart';
import 'package:mister_app/services/profile_service.dart';
import 'package:mister_app/utils/app_routes.dart';
import 'package:mister_app/utils/token_storage.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileService _profileService;

  ProfileCubit(this._profileService) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final semesterController = TextEditingController();
  late UserProfileModel user;
  Future<void> fetchProfile(String token) async {
    emit(ProfileLoading());
    try {
      user = await _profileService.getProfile();
      nameController.text = user.name;
      emailController.text = user.email;
      subjectController.text = user.subject;
      semesterController.text = user.semester;
      emit(ProfileSuccess(UserProfileModel(
          name: nameController.text,
          email: emailController.text,
          semester: semesterController.text,
          subject: subjectController.text)));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String subject,
    required String semester,
  }) async {
    emit(UpdateProfileLoading());

    try {
      UserProfileModel updatedUser = await _profileService.updateProfile(
        name: name,
        email: email,
        subject: subject,
        semester: semester,
      );
      nameController.text = updatedUser.name;
      emailController.text = updatedUser.email;
      subjectController.text = updatedUser.subject;
      semesterController.text = updatedUser.semester;
      emit(UpdateProfileSuccess(updatedUser));
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
      emit(ProfileSuccess(user));
    }
  }

  Future<void> logout(BuildContext context) async {
    await TokenStorage.clearToken();
    emailController.clear();
    SigninCubit.get(context).emailController.clear();
    SigninCubit.get(context).passwordController.clear();
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.signin, (route) => false);
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    semesterController.dispose();

    return super.close();
  }
}
