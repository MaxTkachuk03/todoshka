import 'package:flutter/material.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/colors.dart';
import 'package:todoshka/resources/fonts.dart';

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
        label: Text(
          S.of(context).exit,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 24.0,
            fontFamily: AppFonts.fontFamily,
            fontWeight: AppFonts.normal,
          ),
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
