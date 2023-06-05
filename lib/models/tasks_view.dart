import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoshka/resources/colors.dart';
import 'package:todoshka/resources/icons.dart';
import 'package:todoshka/widgets/buttons/icon_button_wrapper.dart';

import '../resources/fonts.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    super.key,
    required this.type,
    required this.text,
    required this.date,
    required this.status,
    required this.onPressed,
  });

  final int type;
  final String text;
  final String date;
  final int status;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5.0,
        ),
        Container(
          height: 65.0,
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),
              (type == 1)
                  ? SvgPicture.asset(
                      AppIcons.work,
                    )
                  : Container(),
              (type == 2)
                  ? SvgPicture.asset(
                      AppIcons.personal,
                    )
                  : Container(),
              const SizedBox(
                width: 11.67,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        color: AppColors.blackSecond,
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        color: AppColors.blackSecond,
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.bold,
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ),
              IconButtonWrapper(
                icon: (status == 1)
                    ? SvgPicture.asset(
                        AppIcons.taskStatus,
                      )
                    : (status == 2)
                        ? SvgPicture.asset(
                            AppIcons.taskDone,
                          )
                        : Container(),
                onPressed: onPressed,
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
