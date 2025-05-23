import 'package:flutter/material.dart';
import 'package:quran_app/core/services/quran_service.dart';

class QuranProvider with ChangeNotifier {
  final QuranService _service = QuranService();

  Map<String, dynamic>? _lastRead;
  List<dynamic> _surah = [];
  Map<String, dynamic>? _surahDetail;
  List<dynamic> _juz = [];
  List<dynamic> _bookmarks = [];

  bool isLoading = false;
  String? error;

  Map<String, dynamic>? get lastRead => _lastRead;
  List<dynamic> get surah => _surah;
  Map<String, dynamic>? get surahDetail => _surahDetail;
  List<dynamic> get juz => _juz;
  List<dynamic> get bookmarks => _bookmarks;

  Future<void> fetchQuranData() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      _lastRead = await _service.getLastRead();
      final surahData = await _service.getSurah();

      if (surahData.isNotEmpty) {
        _surah = surahData;
        print("Successfully loaded ${_surah.length} surahs");
      } else {
        error = "No surah data returned from API";
        print(error);
      }

      _juz = await _service.getJuz();
      _bookmarks = await _service.getBookmarks();
    } catch (e) {
      error = "Error fetching data: $e";
      print("Error fetching Quran data: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchSurahDetail(int surahNumber) async {
    isLoading = true;
    error = null;
    _surahDetail = null; // Clear previous data
    notifyListeners();

    try {
      final detailData = await _service.getSurahDetail(surahNumber);

      if (detailData.isNotEmpty) {
        _surahDetail = detailData;
        print("Successfully loaded surah detail for surah #$surahNumber");
      } else {
        error = "No detail data returned for surah #$surahNumber";
        print(error);
      }
    } catch (e) {
      error = "Error fetching surah detail: $e";
      print("Error fetching surah detail: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
