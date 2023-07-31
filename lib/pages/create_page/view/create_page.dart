import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/pages/pages.dart';
import 'package:todoshka/repository/repository.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

class CreatingPage extends StatefulWidget {
  const CreatingPage({super.key});

  static const String routeName = 'pages/create';

  @override
  State<CreatingPage> createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingPage> {
  bool click = false;
  int counter = 0;
  int urgent = 0;

  static const double containerHeiht = 50.0;
  static const double containerHeight2 = 98.0;
  static const double sizedBoxHeight = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: AppThemes.backgrounDecoration,
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButtonWrapper(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed(
                        MainPage.routeName,
                      );
                    },
                    icon: SvgPicture.asset(
                      AppIcons.back,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: S.of(context).nameTask,
                        hintStyle: AppStyles.mainStyle,
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            ChooseType(
              containerHeiht: containerHeiht,
              counter: counter,
              onPressed: () {
                setState(
                  () {
                    counter = 1;
                  },
                );
              },
              onPressed2: () {
                setState(
                  () {
                    counter = 2;
                  },
                );
              },
            ),
            const SizedBox(
              height: sizedBoxHeight,
            ),
            const DescriptionTask(
              containerHeight2: containerHeight2,
            ),
            const SizedBox(
              height: sizedBoxHeight,
            ),
            const AttachFile(
              containerHeiht: containerHeiht,
            ),
            const SizedBox(
              height: sizedBoxHeight,
            ),
            CreateFinishDate(
              click: click,
              containerHeiht: containerHeiht,
              onPressed: () {
                setState(() {
                  click = true;
                  selectDate(
                    context,
                  );
                });
              },
            ),
            const SizedBox(
              height: sizedBoxHeight,
            ),
            UrgentTask(
              containerHeiht: containerHeiht,
              urgent: urgent,
              onPressed: () {
                setState(
                  () {
                    urgent++;
                  },
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            OtherButton(
              text: S.of(context).create,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  MainPage.routeName,
                );
              },
              color: AppColors.yellow,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}