import 'package:flutter/material.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

class DescriptionTask extends StatelessWidget {
  const DescriptionTask({
    super.key,
    required this.containerHeight2,
    this.controller,
    this.defaultDescription,
  });

  final double containerHeight2;
  final TextEditingController? controller;
  final String? defaultDescription;
  @override
  Widget build(BuildContext context) {
    return EditAndCreatePageContainer(
      height: containerHeight2,
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              const SizedBox(
                width: 34.0,
              ),
              Expanded(
                flex: 14,
                child: TextField(
                  maxLines: 2,
                  controller: controller,
                  style: AppStyles.simpleStyle,
                  decoration: InputDecoration(
                    hintText: defaultDescription,
                    hintStyle: AppStyles.simpleStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
