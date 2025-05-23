import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SurahDetailsListItem extends StatelessWidget {
  final int number;
  final String arabText;
  final String translationText;

  const SurahDetailsListItem({
    super.key,
    required this.number,
    required this.arabText,
    required this.translationText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ayat number and share button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple.shade700,
                ),
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(HugeIcons.strokeRoundedShare02, color: Colors.grey),
                onPressed: () {
                  // Share functionality bisa ditambahkan di sini
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Arabic text (RTL)
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              arabText,
              style: const TextStyle(
                fontSize: 26,
                height: 1.8,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Translation
          Text(
            translationText,
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.grey[800]),
        ],
      ),
    );
  }
}
