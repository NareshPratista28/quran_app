import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/core/theme/theme_constants.dart';
import 'package:quran_app/presentation/widgets/splash_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                const SizedBox(height: 120),
                Text('Quran App', style: AppTextStyles.splashHeading),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90),
                  child: Text(
                    'Learn Quran and Recite once everyday',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.splashSubHeading,
                  ),
                ),
                const SizedBox(height: 49),
                SvgPicture.asset('assets/images/splash_image.svg'),
              ],
            ),
            Positioned(bottom: 200, child: SplashButton()),
          ],
        ),
      ),
    );
  }
}
