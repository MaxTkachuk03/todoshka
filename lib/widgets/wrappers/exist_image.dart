import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/wrappers/wrappers.dart';

class ExistImage extends StatelessWidget {
  const ExistImage({
    super.key,
    required this.file,
    required this.containerHeiht,
    required this.taskId,
  });

  final String file;
  static const picture = 236.0;
  final double containerHeiht;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return EditAndCreatePageContainer(
        height: file.isEmpty ? containerHeiht : 300,
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).nestedImage,
                    style: AppStyles.simpleStyle,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Image.memory(
                          base64Decode(file),
                          height: picture,
                          width: picture,
                          fit: BoxFit.contain,
                        ),
                      ),
                      CloseButton(
                        onPressed: () {
                          if (taskId.isEmpty) {
                            context
                                .read<TasksBloc>()
                                .add(DeleteNewImageEvent());
                          } else {
                            context.read<TasksBloc>().add(DeleteExistImageEvent(
                                  taskId: taskId,
                                ));
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      );
    });
  }
}
