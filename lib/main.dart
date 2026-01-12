import 'package:flutter/material.dart';
import 'package:frutto/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.beirutiTextTheme();
  await GoogleFonts.pendingFonts();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frutto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.beirutiTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
