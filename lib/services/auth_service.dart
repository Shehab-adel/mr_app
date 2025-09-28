import 'package:dio/dio.dart';

class RegisterService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://edu-master-js.vercel.app/api/"),
  );

  Future<Map<String, dynamic>> registerUser({
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

      return {
        "success": true,
        "data": response.data,
      };
    } catch (e) {
      if (e is DioException) {
        return {
          "success": false,
          "message": e.response?.data["message"] ?? "Something went wrong",
        };
      }
      return {
        "success": false,
        "message": e.toString(),
      };
    }
  }
}
