import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoshka/blocs/tasks_bloc/tasks_bloc.dart';
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
  late int defaulturgent;
  late int defaultcounter;
  late DateTime defaultselectedDate;
  final name = TextEditingController();
  final description = TextEditingController();
  late String defaultName;
  late String defaultDescription;

  static const double containerHeiht = 50.0;
  static const double containerHeight2 = 98.0;
  static const double sizedBoxHeight = 16.0;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    defaulturgent = arguments['urgent'];
    defaultcounter = arguments['type'];
    defaultselectedDate = arguments['finishDate'];
    defaultDescription = arguments['description'];
    defaultName = arguments['name'];

    return BlocProvider(
      create: (BuildContext context) => TasksBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: AppThemes.backgrounDecoration,
          child: BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
            return Column(
              children: [
                const Spacer(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                          child: IconButtonWrapper(
                        onPressed: () {
                          Navigator.of(context)
                              .popAndPushNamed(MainPage.routeName);
                        },
                        icon: SvgPicture.asset(AppIcons.back),
                      )),
                      Flexible(
                          flex: 7,
                          child: TextField(
                            maxLines: 1,
                            controller: name,
                            textAlign: TextAlign.center,
                            style: AppStyles.mainStyle,
                            decoration: InputDecoration(
                              hintText: defaultName,
                              hintStyle: AppStyles.mainStyle,
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.text,
                          )),
                      Expanded(
                        child: IconButtonWrapper(
                          onPressed: () {
                            context.read<TasksBloc>().add(CreateTasksEvent(
                                  taskId: name.text,
                                  name: name.text,
                                  description: description.text,
                                  finishDate: selectedDate,
                                  type: defaultcounter,
                                  urgent: defaulturgent,
                                ));
                            Navigator.of(context)
                                .popAndPushNamed(MainPage.routeName);
                          },
                          icon: SvgPicture.asset(AppIcons.done),
                        ),
                      ),
                    ],
                  ),
                ),
                ChooseType(
                    containerHeiht: containerHeiht,
                    counter: defaultcounter,
                    onPressed: () {
                      setState(() {
                        defaultcounter = 1;
                      });
                    },
                    onPressed2: () {
                      setState(() {
                        defaultcounter = 2;
                      });
                    }),
                const SizedBox(height: sizedBoxHeight),
                DescriptionTask(
                  containerHeight2: containerHeight2,
                  controller: description,
                  defaultDescription: defaultDescription,
                ),
                const SizedBox(height: sizedBoxHeight),
                const AttachFile(containerHeiht: containerHeiht),
                const SizedBox(height: sizedBoxHeight),
                CreateFinishDate(
                  containerHeiht: containerHeiht,
                  onPressed: () async {
                    await selectDate(context);
                    setState(() {});
                  },
                  click: true,
                ),
                const SizedBox(height: sizedBoxHeight),
                UrgentTask(
                    containerHeiht: containerHeiht,
                    urgent: defaulturgent,
                    onPressed: () {
                      setState(() {
                        if (defaulturgent == 0) {
                          defaulturgent++;
                        } else {
                          defaulturgent--;
                        }
                      });
                    }),
                const SizedBox(height: 20.0),
                OtherButton(
                  text: S.of(context).delete,
                  onPressed: () {
                    Navigator.of(context).pushNamed(MainPage.routeName);
                    context.read<TasksBloc>().add(DeleteTasksEvent(
                          taskId: defaultName,
                        ));
                  },
                  color: AppColors.red,
                ),
                const Spacer(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
