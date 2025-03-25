import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran_app/core/theme/theme_constants.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.buttonOrange,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: () {
          context.go('/home');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
        ),
        child: Text('Get Started', style: AppTextStyles.splashButton),
      ),
    );
  }
}
