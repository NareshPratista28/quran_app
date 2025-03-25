import 'package:flutter/material.dart';
import 'package:quran_app/core/theme/theme_constants.dart';

class BookmarkListItem extends StatelessWidget {
  final String id;
  final String surah;
  final int ayah;
  final DateTime dateAdded;
  final String note;

  const BookmarkListItem({
    super.key,
    required this.id,
    required this.surah,
    required this.ayah,
    required this.dateAdded,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        "${dateAdded.day}/${dateAdded.month}/${dateAdded.year}";

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
            _buildBookmarkIcon(),
            const SizedBox(width: 16),
            _buildBookmarkDetails(formattedDate),
            _buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBookmarkIcon() {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withOpacity(0.2),
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
      child: Icon(Icons.bookmark, color: AppColors.primary, size: 20),
    );
  }

  Widget _buildBookmarkDetails(String formattedDate) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$surah: $ayah",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Note: $note',
            style: TextStyle(color: Colors.grey, fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            "Added on $formattedDate",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete_outline, color: Colors.redAccent),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Delete bookmark functionality to be implemented"),
          ),
        );
      },
    );
  }
}
