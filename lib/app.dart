import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/presentation/providers/quran_provider.dart';
import 'package:quran_app/presentation/screens/home_screen.dart';
import 'package:quran_app/presentation/screens/splash_screen.dart';
import 'package:quran_app/presentation/screens/surah_detail_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuranProvider(),
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/surah/:id',
      builder: (context, state) {
        final surahId = int.tryParse(state.pathParameters['id'] ?? '1') ?? 1;
        final Map<String, dynamic>? extra =
            state.extra as Map<String, dynamic>?;
        final surahName = extra?['surahName'] as String? ?? 'Surah';

        return SurahDetailScreen(surahNumber: surahId, surahName: surahName);
      },
    ),
  ],
  errorBuilder:
      (context, state) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 60, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: ${state.error}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Kembali ke Halaman Utama'),
              ),
            ],
          ),
        ),
      ),
  // Tambahkan logging
  debugLogDiagnostics: true,
);
