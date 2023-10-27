import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/repository/repository.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

class CreateFinishDate extends StatelessWidget {
  const CreateFinishDate({
    super.key,
    required this.containerHeiht,
    required this.click,
    required this.onPressed, required this.date,
  });

  final double containerHeiht;
  final bool click;
  final void Function() onPressed;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return EditAndCreatePageContainer(
      height: containerHeiht,
      child: Row(
        children: [
          const Spacer(),
          TextButton(
            onPressed: onPressed,
            child: click == true
                ? Text(
                    DateFormat.yMMMMd().format(date),
                    style: AppStyles.simpleStyle,
                  )
                : Text(
                    S.of(context).endDate,
                    style: AppStyles.simpleStyle,
                  ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
