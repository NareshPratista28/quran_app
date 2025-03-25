import 'package:flutter/material.dart';
import 'package:quran_app/core/theme/theme_constants.dart';

class JuzListItem extends StatelessWidget {
  final String id;
  final String name;
  final String startSurah;
  final int startAyah;
  final String endSurah;
  final int endAyah;
  final int verseCount;

  const JuzListItem({
    super.key,
    required this.id,
    required this.name,
    required this.startSurah,
    required this.startAyah,
    required this.endSurah,
    required this.endAyah,
    required this.verseCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            _buildNumberIndicator(),
            const SizedBox(width: 16),
            _buildJuzDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberIndicator() {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withOpacity(0.2),
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
      child: Text(
        '$id',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildJuzDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'From $startSurah:$startAyah to $endSurah:$endAyah',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 2),
          Text(
            'Total verses: $verseCount',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
