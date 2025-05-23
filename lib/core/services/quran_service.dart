import 'package:dio/dio.dart';
import 'api_client.dart';

class QuranService {
  final Dio _dio = ApiClient.dio;

  // Future<Map<String, dynamic>> getLastRead() async {
  //   final response = await _dio.get("/last_read");
  //   return response.data;
  // }

  Future<List<dynamic>> getSurah() async {
    try {
      final response = await _dio.get("/surah");
      print("API Response structure: ${response.data.runtimeType}");

      // Memastikan kita mengakses 'data' dari response API
      if (response.data is Map<String, dynamic>) {
        if (response.data.containsKey('data')) {
          print("Found 'data' key in response");
          return response.data['data'] as List<dynamic>;
        }
      }

      // Fallback ke response langsung jika tidak ada 'data'
      if (response.data is List<dynamic>) {
        return response.data as List<dynamic>;
      }

      print("Unexpected response format: ${response.data}");
      return [];
    } catch (e) {
      print("Error fetching Surah data: $e");
      return []; // Return empty list instead of rethrowing
    }
  }

  Future<Map<String, dynamic>> getSurahDetail(int nomor) async {
    try {
      final response = await _dio.get("/surah/$nomor");
      print("API Detail Response structure: ${response.data.runtimeType}");

      // Memastikan kita mengakses 'data' dari response API
      if (response.data is Map<String, dynamic>) {
        if (response.data.containsKey('data')) {
          print("Found 'data' key in detail response");
          return response.data['data'] as Map<String, dynamic>;
        }

        // Jika tidak ada key 'data', gunakan response langsung
        return response.data as Map<String, dynamic>;
      }

      print("Unexpected detail response format: ${response.data}");
      return {};
    } catch (e) {
      print("Error fetching Surah detail: $e");
      return {}; // Return empty map instead of rethrowing
    }
  }

  Future<Map<String, dynamic>> getLastRead() async {
    // Dummy implementation sementara
    return {'surah': 'Al-Fatihah', 'ayah': 1};
  }

  Future<List<dynamic>> getJuz() async {
    // Dummy implementation sementara
    return [];
  }

  Future<List<dynamic>> getBookmarks() async {
    // Dummy implementation sementara
    return [];
  }
}
