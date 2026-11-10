import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/theme/app_colors.dart';
import 'package:flutter_thai_hotline_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlutterThaiHotlineApp());
}

class FlutterThaiHotlineApp extends StatelessWidget {
  const FlutterThaiHotlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    final kanit = GoogleFonts.kanit();
    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: hotlineNavy,
        primary: hotlineNavy,
        secondary: hotlineBlue,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: hotlineBackground,
    );

    return MaterialApp(
      title: 'สายด่วน THAILAND',
      debugShowCheckedModeBanner: false,
      theme: baseTheme.copyWith(
        textTheme: baseTheme.textTheme.apply(
          fontFamily: kanit.fontFamily,
          fontFamilyFallback: kanit.fontFamilyFallback,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: hotlineBar,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const SplashScreenUI(),
    );
  }
}
