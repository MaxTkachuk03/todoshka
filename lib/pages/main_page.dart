import 'package:flutter/material.dart';
import 'package:todoshka/resources/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = 'main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
      ),
    );
  }
}
