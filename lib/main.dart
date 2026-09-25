import 'package:flutter/material.dart';
import 'constants.dart';
import 'home_page.dart';

void main() => runApp(const LigtasApp());

class LigtasApp extends StatelessWidget {
  const LigtasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LigtasAlert - Rescuee App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimary),
      ),
      home: const HomePage(),
    );
  }
}
