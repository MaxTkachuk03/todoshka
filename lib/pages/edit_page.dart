import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todoshka/pages/main_page.dart';
import 'package:todoshka/resources/icons.dart';
import 'package:todoshka/resources/styles.dart';
import 'package:todoshka/widgets/buttons/icon_button_wrapper.dart';
import 'package:todoshka/widgets/buttons/icon_text_button.dart';
import 'package:todoshka/widgets/buttons/other_button.dart';

import '../generated/l10n.dart';
import '../resources/colors.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  static const String routeName = 'pages/edit';

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  DateTime selectedDate = DateTime.now();
  bool click = false;
  int counter = 0;
  int urgent = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 1),
        lastDate: DateTime(2050));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
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
                      decoration: InputDecoration(
                        hintText: S.of(context).nameTask,
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
            Container(
              height: 50.0,
              width: width,
              color: AppColors.beige,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButtonWrapper(
                        onPressed: () {
                          setState(
                            () {
                              counter = 1;
                            },
                          );
                        },
                        icon: SvgPicture.asset(
                          AppIcons.circle,
                        ),
                      ),
                      counter == 1
                          ? SvgPicture.asset(
                              AppIcons.choose,
                            )
                          : Container(),
                    ],
                  ),
                  Text(
                    S.of(context).works,
                    style: AppStyles.simpleStyle,
                  ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButtonWrapper(
                        onPressed: () {
                          setState(
                            () {
                              counter = 2;
                            },
                          );
                        },
                        icon: SvgPicture.asset(
                          AppIcons.circle,
                        ),
                      ),
                      counter == 2
                          ? SvgPicture.asset(
                              AppIcons.choose,
                            )
                          : Container(),
                    ],
                  ),
                  Text(
                    S.of(context).personal,
                    style: AppStyles.simpleStyle,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              height: 98.0,
              width: width,
              color: AppColors.beige,
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 5,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: S.of(context).addDescription,
                            hintStyle: AppStyles.simpleStyle,
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              height: 50.0,
              width: width,
              color: AppColors.beige,
              child: Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).attachFile,
                      style: AppStyles.simpleStyle,
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              height: 50.0,
              width: width,
              color: AppColors.beige,
              child: Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      _selectDate(
                        context,
                      );
                      setState(() {
                        click = true;
                      });
                    },
                    child: click == true
                        ? Text(
                            "${selectedDate.day} ${DateFormat.LLLL().format(selectedDate)} ${selectedDate.year}",
                            //"${selectedDate.toLocal()}".split(' ')[0],
                            style: AppStyles.simpleStyle,
                          )
                        : Text(
                            S.of(context).endDate,
                            style: AppStyles.simpleStyle,
                          ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              height: 50.0,
              width: width,
              color: AppColors.beige,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Stack(
                    alignment: urgent % 2 != 0
                        ? Alignment.lerp(
                                Alignment.centerLeft, Alignment.center, 0.18)
                            as AlignmentGeometry
                        : Alignment.lerp(
                                Alignment.centerLeft, Alignment.center, 0.1)
                            as AlignmentGeometry,
                    children: [
                      IconTextButton(
                        onPressed: () {
                          setState(
                            () {
                              urgent++;
                            },
                          );
                        },
                        icon: SvgPicture.asset(
                          AppIcons.circle,
                        ),
                        label: Text(
                          S.of(context).urgent,
                          style: AppStyles.simpleStyle,
                        ),
                      ),
                      urgent % 2 != 0
                          ? SvgPicture.asset(
                              AppIcons.choose,
                            )
                          : SvgPicture.asset(
                              AppIcons.circle,
                            ),
                    ],
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
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
