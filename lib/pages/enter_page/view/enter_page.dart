import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todoshka/pages/pages.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/router/router.dart';

@RoutePage()
class EntrancePage extends StatefulWidget {
  const EntrancePage({super.key});

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppThemes.backgrounDecoration,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              EnterButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Welcome to the todoshka!")));
                  AutoRouter.of(context).push(const MainRoute());
                },
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
