import 'package:dio/dio.dart';
import 'package:mister_app/models/user_profile_model.dart';
import 'package:mister_app/utils/app_strings.dart';

class ProfileService {
  final Dio _dio = Dio(BaseOptions(baseUrl: AppStrings.baseUrl));

  Future<UserProfileModel> getProfile(String token) async {
    try {
      final response = await _dio.get(
        "/users/me",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.data["success"] == true && response.data["user"] != null) {
        return UserProfileModel.fromJson(response.data["user"]);
      } else {
        throw Exception("فشل في تحميل بيانات الحساب");
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    } catch (e) {
      throw Exception("حدث خطأ غير متوقع: $e");
    }
  }

  String _handleDioError(DioException e) {
    String errorMessage = "حدث خطأ، حاول مرة أخرى";

    if (e.response != null && e.response!.data != null) {
      final data = e.response!.data;
      if (data is Map && data.containsKey("message")) {
        errorMessage = data["message"];
      } else if (data is Map && data.containsKey("error")) {
        errorMessage = data["error"];
      }
    }
    return errorMessage;
  }
}
