import 'package:flutter/material.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/colors.dart';
import 'package:todoshka/widgets/buttons/appbar_buttons.dart';

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
        child: Column(
          children: [
            Row(
              children: [
                AppBarButton(
                  isEnabled: true,
                  label: S.of(context).all,
                  onPressed: () {},
                ),
                AppBarButton(
                  isEnabled: true,
                  label: S.of(context).works,
                  onPressed: () {},
                ),
                AppBarButton(
                  isEnabled: true,
                  label: S.of(context).pesonal,
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
