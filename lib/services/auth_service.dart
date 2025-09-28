import 'package:dio/dio.dart';
import 'package:mister_app/utils/app_strings.dart';
import 'package:mister_app/models/user_model.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: AppStrings.baseUrl),
  );

  Future<UserModel> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "auth/signup",
        data: {
          "name": name,
          "email": email,
          "password": password,
        },
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  Future<UserModel> signinUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "auth/signin",
        data: {
          "email": email,
          "password": password,
        },
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// دالة خاصة لمعالجة الأخطاء من Dio
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
