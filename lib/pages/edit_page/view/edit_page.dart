import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:todoshka/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/repository/repository.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/router/router.dart';
import 'package:todoshka/widgets/widgets.dart';

@RoutePage()
class EditPage extends StatefulWidget {
  const EditPage({
    super.key,
    required this.tasks,
  });

  final Tasks tasks;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _controllerName = TextEditingController();
  final _controllerDescription = TextEditingController();

  late int urgent;
  late int type;
  late DateTime date;
  late String image;

  static const double containerHeiht = 50.0;
  static const double containerHeight2 = 98.0;
  static const double sizedBoxHeight = 16.0;

  @override
  void initState() {
    urgent = widget.tasks.urgent;
    type = widget.tasks.type;
    date = widget.tasks.finishDate ?? DateTime.now();
    image = widget.tasks.file!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: AppThemes.backgrounDecoration,
        child: BlocBuilder<TasksBloc, TasksState>(
          buildWhen: (oldState, newState) {
            image = newState.file ?? "";

            return newState.file != oldState.file;
          },
          builder: (context, state) {
            return ListView(
              shrinkWrap: false,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: sizedBoxHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: IconButtonWrapper(
                          onPressed: () {
                            AutoRouter.of(context).push(const MainRoute());
                          },
                          icon: SvgPicture.asset(AppIcons.back),
                        )),
                        Flexible(
                            flex: 7,
                            child: TextField(
                              maxLines: 1,
                              controller: _controllerName,
                              textAlign: TextAlign.center,
                              style: AppStyles.mainStyle,
                              decoration: InputDecoration(
                                hintText: widget.tasks.name,
                                hintStyle: AppStyles.mainStyle,
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                            )),
                        Expanded(
                          child: IconButtonWrapper(
                            onPressed: () {
                              context.read<TasksBloc>().add(
                                    CreateTasksEvent(
                                      taskId: widget.tasks.name,
                                      name: _controllerName.text == ''
                                          ? widget.tasks.name
                                          : _controllerName.text,
                                      status: widget.tasks.status!,
                                      type: type,
                                      description:
                                          _controllerDescription.text == ""
                                              ? widget.tasks.description
                                              : _controllerDescription.text,
                                      finishDate: date,
                                      urgent: urgent,
                                      file: state.file,
                                    ),
                                  );
                              AutoRouter.of(context).push(const MainRoute());
                            },
                            icon: SvgPicture.asset(AppIcons.done),
                          ),
                        ),
                      ],
                    ),
                    ChooseType(
                      containerHeiht: containerHeiht,
                      counter: type,
                      onPressed: () {
                        setState(() {
                          type = 1;
                        });
                      },
                      onPressed2: () {
                        setState(() {
                          type = 2;
                        });
                      },
                    ),
                    const SizedBox(height: sizedBoxHeight),
                    DescriptionTask(
                      containerHeight2: containerHeight2,
                      controller: _controllerDescription,
                      defaultDescription: widget.tasks.description,
                    ),
                    const SizedBox(height: sizedBoxHeight),
                    image.isEmpty
                        ? AttachFile(
                            taskId: widget.tasks.taskId,
                            containerHeiht: containerHeiht,
                            onPressed: () {
                              context.read<TasksBloc>().add(AddImageEvent());
                            },
                            file: image, // ?? image,
                          )
                        : ExistImage(
                            taskId: widget.tasks.taskId,
                            file: image,
                            containerHeiht: containerHeiht,
                          ),
                    const SizedBox(height: sizedBoxHeight),
                    CreateFinishDate(
                      date: date,
                      containerHeiht: containerHeiht,
                      onPressed: () async {
                        await GetIt.I<DateServices>()
                            .selectDate(context)
                            .then((value) {
                          date = GetIt.I<DateServices>().selectedDate;
                          setState(() {});
                        });
                      },
                      click: true,
                    ),
                    const SizedBox(height: sizedBoxHeight),
                    UrgentTask(
                        containerHeiht: containerHeiht,
                        urgent: urgent,
                        onPressed: () {
                          setState(() {
                            if (urgent == 0) {
                              urgent++;
                            } else {
                              urgent--;
                            }
                          });
                        }),
                    const SizedBox(height: 20.0),
                    OtherButton(
                      text: S.of(context).delete,
                      onPressed: () {
                        context.read<TasksBloc>().add(DeleteTasksEvent(
                              taskId: widget.tasks.taskId,
                            ));
                        AutoRouter.of(context).push(const MainRoute());
                      },
                      color: AppColors.red,
                    ),
                    const SizedBox(
                      height: sizedBoxHeight,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
