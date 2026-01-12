import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frutto/common/asset_manager.dart';
import 'package:frutto/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _ready = false;

  Future<void> preloadAssets(BuildContext context) async {
    GoogleFonts.beirutiTextTheme();
    await GoogleFonts.pendingFonts();

    final images = [
      AssetManager.apricot,
      AssetManager.apricotImage,
      AssetManager.fig,
      AssetManager.figImage,
      AssetManager.strawberry,
      AssetManager.strawberryImage,
      AssetManager.jam,
    ];

    for (final path in images) {
      if (!context.mounted) return;
      await precacheImage(AssetImage(path), context);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_ready) {
      unawaited(_initialize());
    }
  }

  Future<void> _initialize() async {
    await preloadAssets(context);

    setState(() {
      _ready = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frutto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        textTheme: GoogleFonts.beirutiTextTheme(),
      ),
      home: _ready ? const HomeScreen() : const _Loader(),
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 12,
          color: Colors.greenAccent,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
