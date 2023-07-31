import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todoshka/pages/pages.dart';
import 'package:todoshka/repository/repository.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

import '../../../generated/l10n.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    super.key,
  });

  static const String routeName = 'pages/edit';

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late int counter;
  late int urgent;

  static const double containerHeiht = 50.0;
  static const double containerHeight2 = 98.0;
  static const double sizedBoxHeight = 16.0;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    urgent = arguments['urgent'];
    counter = arguments['type'];
    selectedDate = arguments['finishDate'];

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
                  Flexible(
                    child: IconButtonWrapper(
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed(
                          MainPage.routeName,
                        );
                      },
                      icon: SvgPicture.asset(
                        AppIcons.back,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 7,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: arguments['name'],
                        hintStyle: AppStyles.mainStyle,
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Expanded(
                    child: IconButtonWrapper(
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed(
                          MainPage.routeName,
                        );
                      },
                      icon: SvgPicture.asset(
                        AppIcons.done,
                      ),
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
            const EditFinishDate(
              containerHeiht: containerHeiht,
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
              text: S.of(context).delete,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  MainPage.routeName,
                );
              },
              color: AppColors.red,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}