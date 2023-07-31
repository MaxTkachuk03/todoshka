import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/resources.dart';


class EnterButton extends StatelessWidget {
  const EnterButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 140.0,
      child: FloatingActionButton.extended(
        label: AutoSizeText(
          S.of(context).exit,
          style: AppStyles.buttonStyle,
          minFontSize: 18.0,
          maxFontSize: 24.0,
        ),
        extendedPadding: const EdgeInsets.symmetric(
          horizontal: 45.0,
          vertical: 10.0,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        enableFeedback: true,
        backgroundColor: AppColors.yellow,
        onPressed: onPressed,
      ),
    );
  }
}
