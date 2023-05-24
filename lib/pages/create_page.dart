import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/pages/main_page.dart';
import 'package:todoshka/resources/colors.dart';
import 'package:todoshka/resources/icons.dart';
import 'package:todoshka/resources/styles.dart';
import 'package:todoshka/widgets/buttons/icon_button_wrapper.dart';
import 'package:todoshka/widgets/buttons/other_button.dart';

class CreatingPage extends StatefulWidget {
  const CreatingPage({super.key});

  static const String routeName = 'pages/create';

  @override
  State<CreatingPage> createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingPage> {
  int counter = 0;
  int urgent = 0;
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
                    onPressed: () {},
                    child: Text(
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
                    alignment: Alignment.center,
                    children: [
                      IconButtonWrapper(
                        onPressed: () {
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  urgent = 1;
                                },
                              );
                            },
                            onDoubleTap: () {
                              setState(
                                () {
                                  urgent = 0;
                                },
                              );
                            },
                          );
                        },
                        icon: SvgPicture.asset(
                          AppIcons.circle,
                        ),
                      ),
                      urgent == 1
                          ? SvgPicture.asset(
                              AppIcons.choose,
                            )
                          : SvgPicture.asset(
                              AppIcons.circle,
                            ),
                    ],
                  ),
                  Text(
                    S.of(context).urgent,
                    style: AppStyles.simpleStyle,
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
              text: S.of(context).create,
              onPressed: () {},
              color: AppColors.yellow,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
