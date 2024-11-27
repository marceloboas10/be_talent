import 'package:flutter/material.dart';
import 'package:teste_be_talent/app/pages/home/splash_page.dart';

void main() {
  runApp(const BeTalent());
}

class BeTalent extends StatelessWidget {
  const BeTalent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Be Talent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const SplashPage(),
    );
  }
}
