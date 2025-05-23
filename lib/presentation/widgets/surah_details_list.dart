import 'package:flutter/material.dart';
import 'package:quran_app/presentation/providers/quran_provider.dart';
import 'package:quran_app/presentation/widgets/surah_details_list_item.dart';

class SurahDetailsList extends StatelessWidget {
  final QuranProvider quranProvider;
  const SurahDetailsList({super.key, required this.quranProvider});

  @override
  Widget build(BuildContext context) {
    if (quranProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (quranProvider.error != null) {
      return Center(
        child: Text(
          'Error: ${quranProvider.error}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    final verses = quranProvider.surahDetail?['verses'] as List<dynamic>?;

    if (verses == null || verses.isEmpty) {
      return const Center(
        child: Text(
          'No verses available',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return ListView.builder(
      itemCount: verses.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        try {
          final verse = verses[index];
          return SurahDetailsListItem(
            number: verse['number']?['inSurah'] ?? 0,
            arabText: verse['text']?['arab'] ?? '',
            translationText: verse['translation']?['id'] ?? '',
          );
        } catch (e) {
          print("Error rendering verse at index $index: $e");
          // Fallback widget
          return ListTile(
            title: Text(
              "Error loading verse",
              style: TextStyle(color: Colors.red),
            ),
          );
        }
      },
    );
  }
}
