import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/pages/pages.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    super.key,
    required this.tasks,
  });

  final List<Tasks> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final listInfo = tasks[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(EditPage.routeName, arguments: listInfo);
          },
          child: Column(
            children: [
              const SizedBox(height: 5.0),
              Container(
                height: 65.0,
                decoration: BoxDecoration(
                    color:
                        listInfo.urgent == 1 ? AppColors.red : AppColors.grey,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Spacer(),
                    (listInfo.type == 1)
                        ? SvgPicture.asset(AppIcons.work)
                        : Container(),
                    (listInfo.type == 2)
                        ? SvgPicture.asset(AppIcons.personal)
                        : Container(),
                    const SizedBox(width: 11.67),
                    Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listInfo.name,
                            style: const TextStyle(
                                color: AppColors.blackSecond,
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.bold,
                                fontSize: 16.0),
                          ),
                          Text(
                            listInfo.finishDate.toString().split(" ").first,
                            style: const TextStyle(
                                color: AppColors.blackSecond,
                                fontFamily: AppFonts.fontFamily,
                                fontWeight: AppFonts.bold,
                                fontSize: 11.0),
                          ),
                        ],
                      ),
                    ),
                    IconButtonWrapper(
                        icon: (listInfo.status == 1)
                            ? SvgPicture.asset(AppIcons.taskStatus)
                            : (listInfo.status == 2)
                                ? SvgPicture.asset(AppIcons.taskDone)
                                : Container(),
                        onPressed: () {
                          if (listInfo.status == 1) {
                            listInfo.status = 2;
                          }
                          if (listInfo.status == 2) {
                            listInfo.status = 1;
                          }
                        }),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}