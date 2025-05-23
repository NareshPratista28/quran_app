import 'package:flutter/material.dart';
import 'package:quran_app/presentation/providers/quran_provider.dart';
import 'package:quran_app/presentation/widgets/surah_list_item.dart';

class SurahList extends StatelessWidget {
  final QuranProvider quranProvider;
  const SurahList({super.key, required this.quranProvider});

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
    if (quranProvider.surah.isEmpty) {
      return const Center(
        child: Text(
          'No surah available',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: quranProvider.surah.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final surah = quranProvider.surah[index];
          try {
            return SurahListItem(
              number: surah['number'] ?? 0,
              nameShort: surah['name']?['short'] ?? '',
              nameTransliteration:
                  surah['name']?['transliteration']?['id'] ?? '',
              numberOfVerses: surah['numberOfVerses'] ?? 0,
              revelation: surah['revelation']?['id'] ?? '',
            );
          } catch (e) {
            print("Error rendering Surah at index $index: $e");
            // Fallback widget
            return ListTile(
              title: Text(
                "Error loading surah",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
        },
      ),
    );
  }
}
