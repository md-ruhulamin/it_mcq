import 'package:dio/dio.dart';
import 'package:it_mcq/dio_client/failure.dart';

class GithubApiService {
  final Dio dio;

  GithubApiService(this.dio);

  Future<String> loadRawFile(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return response.data; // Raw JSON string
      } else {
        throw Failure("Server error: ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Failure("Request timed out");
      }

      if (e.type == DioExceptionType.connectionError) {
        throw Failure("Check your internet connection");
      }

      throw Failure("Unexpected error: ${e.message}");
    } catch (e) {
      throw Failure("Unknown error occurred");
    }
  }
}
