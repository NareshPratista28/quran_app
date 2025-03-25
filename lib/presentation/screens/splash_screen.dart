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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppTheme.darkTheme.scaffoldBackgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                SizedBox(height: screenHeight * 0.15),
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
                // SizedBox(height: screenHeight * 0.01),
                SvgPicture.asset(
                  'assets/images/splash_image.svg',
                  width: screenWidth * 0.75,
                ),
              ],
            ),
            Positioned(bottom: screenHeight * 0.175, child: SplashButton()),
          ],
        ),
      ),
    );
  }
}
