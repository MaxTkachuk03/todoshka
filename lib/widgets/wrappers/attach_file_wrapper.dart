import 'package:flutter/material.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

class AttachFile extends StatelessWidget {
  const AttachFile({
    super.key,
    required this.containerHeiht,
    this.onPressed,
    required this.file,
    this.taskId = "",
  });

  final double containerHeiht;
  final void Function()? onPressed;
  final String file;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return EditAndCreatePageContainer(
      height: file.isEmpty ? containerHeiht : 300,
      child: file.isEmpty
          ? Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 10,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: onPressed,
                        child: Text(
                          S.of(context).attachFile,
                          style: AppStyles.simpleStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
              ],
            )
          : ExistImage(
              file: file,
              containerHeiht: containerHeiht,
              taskId: taskId,
            ),
    );
  }
}
