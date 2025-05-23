import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/theme/theme_constants.dart';

class SurahListItem extends StatelessWidget {
  final int number;
  final String nameShort;
  final String nameTransliteration;
  final int numberOfVerses;
  final String revelation;

  const SurahListItem({
    super.key,
    required this.number,
    required this.nameShort,
    required this.nameTransliteration,
    required this.numberOfVerses,
    required this.revelation,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/surah/$number', extra: {'surahName': nameTransliteration});
      },
      child: Container(
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
              _buildSurahDetails(),
              _buildArabicName(),
            ],
          ),
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
        number.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSurahDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nameTransliteration,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$revelation • $numberOfVerses VERSES',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildArabicName() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(
        nameShort,
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
