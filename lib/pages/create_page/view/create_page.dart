import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:todoshka/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/repository/repository.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/router/router.dart';
import 'package:todoshka/widgets/widgets.dart';

@RoutePage()
class CreatingPage extends StatefulWidget {
  const CreatingPage({super.key});

  @override
  State<CreatingPage> createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingPage> {
  final _name = TextEditingController();
  final _description = TextEditingController();
  bool click = false;
  int counter = 0;
  int urgent = 0;
  DateTime date = DateTime.now();
  String image = "";

  static const double containerHeiht = 50.0;
  static const double containerHeight2 = 98.0;
  static const double sizedBoxHeight = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: AppThemes.backgrounDecoration,
        child:
            BlocBuilder<TasksBloc, TasksState>(buildWhen: (oldState, newState) {
              image = newState.file ?? "";
          return newState.file != oldState.file;
        }, builder: (context, state) {
          return ListView(
            shrinkWrap: false,
            children: [
              Column(
                children: [
                  const SizedBox(height: sizedBoxHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButtonWrapper(
                        onPressed: () {
                          AutoRouter.of(context).push(const MainRoute());
                        },
                        icon: SvgPicture.asset(AppIcons.back),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _name,
                          textAlign: TextAlign.center,
                          style: AppStyles.mainStyle,
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
                  ChooseType(
                    containerHeiht: containerHeiht,
                    counter: counter,
                    onPressed: () {
                      setState(() {
                        counter = 1;
                      });
                    },
                    onPressed2: () {
                      setState(() {
                        counter = 2;
                      });
                    },
                  ),
                  const SizedBox(height: sizedBoxHeight),
                  DescriptionTask(
                      containerHeight2: containerHeight2,
                      controller: _description),
                  const SizedBox(height: sizedBoxHeight),
                  AttachFile(
                    containerHeiht: containerHeiht,
                    onPressed: () {
                      context.read<TasksBloc>().add(AddImageEvent());
                    },
                    file: image,
                  ),
                  const SizedBox(height: sizedBoxHeight),
                  CreateFinishDate(
                    click: click,
                    containerHeiht: containerHeiht,
                    onPressed: () async {
                      date = await GetIt.I<DateServices>().selectDate(context);
                      setState(() {
                        click = true;
                      });
                    },
                    date: date,
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
                    text: S.of(context).create,
                    onPressed: () {
                      context.read<TasksBloc>().add(CreateTasksEvent(
                            taskId: _name.text,
                            status: 1,
                            name: _name.text,
                            type: counter,
                            description: _description.text,
                            file: state.file,
                            urgent: urgent,
                            finishDate: date,
                          ));
                      const Duration(seconds: 3);
                      AutoRouter.of(context).push(const MainRoute());
                    },
                    color: AppColors.yellow,
                  ),
                  const SizedBox(height: sizedBoxHeight),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
