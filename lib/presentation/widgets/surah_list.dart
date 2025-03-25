import 'package:flutter/material.dart';
import 'package:quran_app/presentation/providers/quran_provider.dart';
import 'package:quran_app/presentation/widgets/surah_list_item.dart';

class SurahList extends StatelessWidget {
  final QuranProvider quranProvider;
  const SurahList({super.key, required this.quranProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: quranProvider.surah.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final surah = quranProvider.surah[index];
          return SurahListItem(
            id: surah['id'],
            name: surah['name'],
            arabic: surah['arabic'],
            revelation: surah['revelation'],
            totalVerses: surah['total_verses'],
          );
        },
      ),
    );
  }
}
