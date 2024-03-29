import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoshka/repository/repository.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

class EditFinishDate extends StatelessWidget {
  const EditFinishDate({
    super.key,
    required this.containerHeiht,
    required this.onPressed,
  });

  final double containerHeiht;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return EditAndCreatePageContainer(
      height: containerHeiht,
      child: Row(
        children: [
          const Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text(
              "${selectedDate.day} ${DateFormat.LLLL().format(selectedDate)} ${selectedDate.year}",
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
