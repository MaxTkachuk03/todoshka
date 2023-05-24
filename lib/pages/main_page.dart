import 'package:flutter/material.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/colors.dart';
import 'package:todoshka/widgets/buttons/appbar_buttons.dart';
import 'package:todoshka/widgets/buttons/plus_buton.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = 'main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarButton(
                    isEnabled: active,
                    label: S.of(context).all,
                    onPressed: () {},
                    heroTag: S.of(context).all,
                  ),
                  AppBarButton(
                    isEnabled: active,
                    label: S.of(context).works,
                    onPressed: () {},
                    heroTag: S.of(context).works,
                  ),
                  AppBarButton(
                    isEnabled: active,
                    label: S.of(context).personal,
                    onPressed: () {},
                    heroTag: S.of(context).personal,
                  ),
                ],
              ),
              //ListView.builder(itemBuilder: (context, index) => Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                     right: 12.0,
                    ),
                    child: PlusButton(
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
