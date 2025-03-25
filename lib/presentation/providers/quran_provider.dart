import 'package:flutter/material.dart';
import 'package:quran_app/core/services/quran_service.dart';

class QuranProvider with ChangeNotifier {
  final QuranService _service = QuranService();

  Map<String, dynamic>? _lastRead;
  List<dynamic> _surah = [];
  List<dynamic> _juz = [];
  List<dynamic> _bookmarks = [];

  bool isLoading = false;
  String? error;

  Map<String, dynamic>? get lastRead => _lastRead;
  List<dynamic> get surah => _surah;
  List<dynamic> get juz => _juz;
  List<dynamic> get bookmarks => _bookmarks;

  Future<void> fetchQuranData() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      _lastRead = await _service.getLastRead();
      _surah = await _service.getSurah();
      _juz = await _service.getJuz();
      _bookmarks = await _service.getBookmarks();
    } catch (e) {
      error = "Error fetching data: $e";
      print("Error fetching Quran data: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
