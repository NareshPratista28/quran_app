import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/theme_constants.dart';
import 'package:quran_app/presentation/providers/quran_provider.dart';
import 'package:quran_app/presentation/widgets/surah_details_list.dart';

class SurahDetailScreen extends StatefulWidget {
  final int surahNumber;
  final String surahName;

  const SurahDetailScreen({
    super.key,
    required this.surahNumber,
    required this.surahName,
  });

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuranProvider>(
        context,
        listen: false,
      ).fetchSurahDetail(widget.surahNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    final quranProvider = Provider.of<QuranProvider>(context);
    final surahDetail = quranProvider.surahDetail;

    return Scaffold(
      backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
        leading: IconButton(
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft02,
            color: AppColors.secondary,
          ),
          onPressed: () {
            context.go('/home');
          },
        ),
        title: Text(
          widget.surahName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body:
          quranProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : quranProvider.error != null
              ? Center(
                child: Text(
                  'Error: ${quranProvider.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              )
              : surahDetail == null
              ? const Center(
                child: Text(
                  'No data available',
                  style: TextStyle(color: Colors.white),
                ),
              )
              : Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/images/detail_screen_banner.svg',
                          width: 200,
                        ),
                        Positioned(
                          top: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  surahDetail['name']?['short'] ?? '',
                                  style: AppTextStyles.surahDetailTitle,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  surahDetail['name']?['translation']?['id'] ??
                                      '',
                                  style: AppTextStyles.surahDetailTranslation,
                                ),
                                const SizedBox(height: 8),
                                Divider(),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      '${surahDetail['revelation']?['id'] ?? ''} - ${surahDetail['numberOfVerses'] ?? 0} Ayat',
                                      style:
                                          AppTextStyles.surahDetailRevelation,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      child: SurahDetailsList(quranProvider: quranProvider),
                    ),
                  ],
                ),
              ),
    );
  }
}
