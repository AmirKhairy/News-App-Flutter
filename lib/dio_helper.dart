import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  // Initialize Dio with base options
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsdata.io/api/1/', // Base URL for NewsData API
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // Function to get data with dynamic URL and query parameters
  static Future<Response?> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    try {
      // Append the API key to the query parameters

      // Make the GET request
      return await dio?.get(
        url,
        queryParameters: query,
      );
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}
