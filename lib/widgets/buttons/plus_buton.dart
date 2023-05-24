import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/colors.dart';
import 'package:todoshka/resources/icons.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 71.0,
      width: 71.0,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.blackShadow,
          offset: Offset(0, 4.0),
          blurRadius: 4.0,
        ),
      ]),
      child: FloatingActionButton.extended(
        heroTag: S.of(context).create,
        label: SvgPicture.asset(
          AppIcons.plus,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        backgroundColor: AppColors.yellow,
        onPressed: onPressed,
      ),
    );
  }
}
