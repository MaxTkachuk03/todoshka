import 'package:flutter/material.dart';
import 'package:todoshka/resources/colors.dart';
import 'package:todoshka/widgets/buttons/enter_button.dart';

class EntrancePage extends StatefulWidget {
  const EntrancePage({super.key});

  static const String routeName = 'pages/enter';

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              EnterButton(
                onPressed: () {},
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
