import 'package:flutter/material.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

class AttachFile extends StatelessWidget {
  const AttachFile({
    super.key,
    required this.containerHeiht,
  });

  final double containerHeiht;

  @override
  Widget build(BuildContext context) {
    return EditAndCreatePageContainer(
      height: containerHeiht,
      child: Row(
        children: [
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              S.of(context).attachFile,
              style: AppStyles.simpleStyle,
            ),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
  }
}
