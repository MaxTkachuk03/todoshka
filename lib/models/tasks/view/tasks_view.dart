// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoshka/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/pages/pages.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

class TasksView extends StatelessWidget {
  TasksView({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<Tasks> tasks;
  int status = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksBloc, TasksState>(
      listener: (context, state) {
         context
                                .read<TasksBloc>()
                                .add(CreateTasksEvent(status: status));
      },
      builder: (context, state) {
      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final listInfo = tasks[index];
          listInfo.status = TasksCreateAndUpdateState().status;
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(EditPage.routeName, arguments: {
                'name': listInfo.name,
                'type': listInfo.type,
                'urgent': listInfo.urgent,
                'finishDate': listInfo.finishDate,
                'description': listInfo.description
              });
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
                            if (status == 1) {
                              status++;
                            }
                            if (status == 2) {
                              status--;
                            }
                            context
                                .read<TasksBloc>()
                                .add(CreateTasksEvent(status: status));
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
    });
  }
}
