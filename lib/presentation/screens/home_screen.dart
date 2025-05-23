import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/core/theme/theme_constants.dart';
import 'package:quran_app/presentation/providers/quran_provider.dart';
import 'package:quran_app/presentation/widgets/tab_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuranProvider>(context, listen: false).fetchQuranData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final quranProvider = Provider.of<QuranProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedMenu02,
            color: AppColors.secondary,
          ),
        ),
        title: Text('Quran App', style: AppTextStyles.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Assalamu\'alaykum', style: AppTextStyles.headingSecondary),
              const SizedBox(height: 4),
              Text('Naresh Pratista', style: AppTextStyles.headingPrimary),
              const SizedBox(height: 24),
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/last_read_home.svg',
                    width: screenWidth * 1,
                  ),
                  Positioned(
                    top: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                HugeIcons.strokeRoundedBookOpen02,
                                color: AppColors.textPrimary,
                                size: 32,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Last Read',
                                style: AppTextStyles.lastReadTitle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            quranProvider.lastRead?['surah'] ?? 'Al-Fatihah',
                            style: AppTextStyles.lastReadSurah,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Ayah No: ${quranProvider.lastRead?['ayah'] ?? 1}',
                            style: AppTextStyles.lastReadAyah,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TabNavigation(quranProvider: quranProvider),
            ],
          ),
        ),
      ),
    );
  }
}
