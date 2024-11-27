import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();
  static ColorsApp get instance => _instance ??= ColorsApp._();

  Color get bluePrimary => const Color(0xFF0500ff);
  Color get blue10 => const Color(0xFFEDEFFB);
  Color get black => const Color(0xFF1C1C1C);
  Color get gray20 => const Color(0xFF9E9E9E);
  Color get gray10 => const Color(0xFFDFDFDF);
  Color get gray5=> const Color(0xFFF5F5F5);
  Color get gray0 => const Color(0xFFF0F0F0);
  Color get white => const Color(0xFFFFFFFF);
}

extension ColorsAppExtention on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
