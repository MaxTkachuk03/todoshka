import 'package:flutter/material.dart';
import 'package:todoshka/pages/main_page.dart';
import 'package:todoshka/repository/services/api_services.dart';
import 'package:todoshka/repository/services/check_internet_services.dart';
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
                flex: 3,
              ),
              EnterButton(
                onPressed: () {
                  checkInternetConnection().then((value) {
                    if (value == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Welcome to the todoshka!"),
                        ),
                      );
                      ApiServices().getTasks();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        MainPage.routeName,
                        (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please, connect to internet!"),
                        ),
                      );
                    }
                  });
                  //
                },
              ),
              const Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}
