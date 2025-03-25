import 'package:dio/dio.dart';
import 'api_client.dart';

class QuranService {
  final Dio _dio = ApiClient.dio;

  Future<Map<String, dynamic>> getLastRead() async {
    final response = await _dio.get("/last_read");
    return response.data;
  }

  Future<List<dynamic>> getSurah() async {
    final response = await _dio.get("/surah");
    return response.data;
  }

  Future<List<dynamic>> getJuz() async {
    final response = await _dio.get("/juz");
    return response.data;
  }

  Future<List<dynamic>> getBookmarks() async {
    final response = await _dio.get("/bookmarks");
    return response.data;
  }
}
