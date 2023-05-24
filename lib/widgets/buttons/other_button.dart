import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:todoshka/resources/styles.dart';

class OtherButton extends StatelessWidget {
  const OtherButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  final void Function() onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 170.0,
      child: FloatingActionButton.extended(
        label: AutoSizeText(
          text,
          minFontSize: 18.0,
          maxFontSize: 24.0,
          style: AppStyles.buttonStyle,
        ),
        extendedPadding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        enableFeedback: true,
        backgroundColor: color,
        onPressed: onPressed,
      ),
    );
  }
}
