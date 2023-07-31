import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:todoshka/resources/resources.dart';


class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.isEnabled,
    required this.heroTag,
  });

  final String label;
  final String heroTag;
  final void Function() onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: 106.0,
      decoration: isEnabled == true
          ? const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackShadow,
                  offset: Offset(0, 4.0),
                  blurRadius: 4.0,
                ),
              ],
            )
          : null,
      child: FloatingActionButton.extended(
        autofocus: true,
        heroTag: heroTag,
        label: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 13.0,
          ),
          child: AutoSizeText(
            label,
            maxLines: 1,
            maxFontSize: 18.0,
            minFontSize: 14.0,
            style: const TextStyle(
              color: AppColors.black,
              //fontSize: 18.0,
              fontFamily: AppFonts.fontFamily,
             // fontWeight: AppFonts.normal,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        enableFeedback: isEnabled,
        backgroundColor: isEnabled == true ? AppColors.beige : AppColors.grey,
        onPressed: onPressed,
      ),
    );
  }
}
