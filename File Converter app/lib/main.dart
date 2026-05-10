// Developed by Muhammad FaheeM
// File Converter Pro - All-in-One Format Converter
// Version 1.0.0

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_converter_app/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FileConverterPro());
}

class FileConverterPro extends StatelessWidget {
  const FileConverterPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Converter Pro - Muhammad FaheeM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}