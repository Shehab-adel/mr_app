import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mister_app/cubit/profile/profile_state.dart';
import 'package:mister_app/models/user_profile_model.dart';
import 'package:mister_app/services/profile_service.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileService _profileService;

  ProfileCubit(this._profileService) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> fetchProfile(String token) async {
    emit(ProfileLoading());
    try {
      final UserProfileModel user = await _profileService.getProfile(token);
      emit(ProfileSuccess(user));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
