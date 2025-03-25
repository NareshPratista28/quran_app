import 'package:flutter/material.dart';
import 'package:quran_app/presentation/providers/quran_provider.dart';
import 'package:quran_app/presentation/widgets/juz_list_item.dart';

class JuzList extends StatelessWidget {
  final QuranProvider quranProvider;

  const JuzList({super.key, required this.quranProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: quranProvider.juz.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final juz = quranProvider.juz[index];
          return JuzListItem(
            id: juz['id'],
            name: juz['name'],
            startSurah: juz['start']['surah'],
            startAyah: juz['start']['ayah'],
            endSurah: juz['end']['surah'],
            endAyah: juz['end']['ayah'],
            verseCount: juz['verse_count'],
          );
        },
      ),
    );
  }
}
