import 'package:flutter/material.dart';
import 'package:quran_app/presentation/providers/quran_provider.dart';
import 'package:quran_app/presentation/widgets/bookmark_list_item.dart';

class BookmarkList extends StatelessWidget {
  final QuranProvider quranProvider;

  const BookmarkList({super.key, required this.quranProvider});

  @override
  Widget build(BuildContext context) {
    if (quranProvider.bookmarks.isEmpty) {
      return Center(
        child: Text(
          'No bookmark data available',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: quranProvider.bookmarks.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final bookmark = quranProvider.bookmarks[index];
          return BookmarkListItem(
            id: bookmark['id'],
            surah: bookmark['surah'],
            ayah: bookmark['ayah'],
            dateAdded: DateTime.parse(bookmark['date_added']),
            note: bookmark['note'],
          );
        },
      ),
    );
  }
}
