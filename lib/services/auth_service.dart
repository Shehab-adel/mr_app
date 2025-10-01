import 'package:dio/dio.dart';
import 'package:mister_app/utils/app_strings.dart';
import 'package:mister_app/models/user_auth_model.dart';
import 'package:mister_app/utils/token_storage.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: AppStrings.baseUrl),
  );

  Future<UserAuthModel> registerUser({
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
      return UserAuthModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  Future<UserAuthModel> signinUser({
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

      return UserAuthModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// ✅ تحديث study-info باستخدام Dio
  Future<UserAuthModel> updateStudyInfo(String semester) async {
    final token = await TokenStorage.getToken();

    if (token == null) throw Exception("Token not found");

    try {
      final response = await _dio.put(
        "users/study-info",
        data: {
          "stage": "ثانوي",
          "semester": semester,
          "subject": "اللغة الانجليزية",
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token", // التوكن مطلوب هنا
          },
        ),
      );

      final data = response.data;

      if (response.statusCode == 200 && data["success"] == true) {
        // برجع UserAuthModel محدث بالبيانات الجديدة
        return UserAuthModel.fromJson(data["user"]);
      } else {
        throw Exception(data["message"] ?? "Update failed");
      }
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  /// 🛠️ دالة خاصة لمعالجة الأخطاء من Dio
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
