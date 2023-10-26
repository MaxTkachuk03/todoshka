import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoshka/blocs/tasks_list_bloc/task_list_bloc_bloc.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/router/router.dart';
import 'package:todoshka/widgets/widgets.dart';

class TasksView extends StatelessWidget {
  const TasksView({
    super.key,
    required this.tasks,
  });

  final Tasks tasks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListBloc, TaskListBlocState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(EditRoute(tasks: tasks));
          },
          child: Column(
            children: [
              const SizedBox(height: 5.0),
              Container(
                height: 65.0,
                decoration: BoxDecoration(
                    color: tasks.urgent == 1 ? AppColors.red : AppColors.grey,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                child: ListTile(
                  leading: (tasks.type == 1)
                      ? SvgPicture.asset(AppIcons.work)
                      : SvgPicture.asset(AppIcons.personal),
                  title: Text(
                    tasks.name,
                    style: const TextStyle(
                        color: AppColors.blackSecond,
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.bold,
                        fontSize: 16.0),
                  ),
                  subtitle: Text(
                    tasks.finishDate.toString().split(" ").first,
                    style: const TextStyle(
                        color: AppColors.blackSecond,
                        fontFamily: AppFonts.fontFamily,
                        fontWeight: AppFonts.bold,
                        fontSize: 11.0),
                  ),
                  trailing: IconButtonWrapper(
                    icon: (tasks.status == 1)
                        ? SvgPicture.asset(AppIcons.taskStatus)
                        : SvgPicture.asset(AppIcons.taskDone),
                    onPressed: () {
                      if (tasks.status == 1) {
                        context.read<TaskListBloc>().add(
                            ChangeStatusEvent(taskId: tasks.taskId, status: 2));
                      } if(tasks.status == 2) {
                        context.read<TaskListBloc>().add(
                            ChangeStatusEvent(taskId: tasks.taskId, status: 1));
                      }
                    },

                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


/*




*/