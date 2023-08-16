import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

class UrgentTask extends StatelessWidget {
  const UrgentTask({
    super.key,
    required this.containerHeiht,
    required this.urgent,
    required this.onPressed,
  });

  final double containerHeiht;
  final int urgent;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return EditAndCreatePageContainer(
      height: containerHeiht,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Stack(
            alignment: urgent == 1
                ? Alignment.lerp(Alignment.centerLeft, Alignment.center, 0.18)
                    as AlignmentGeometry
                : Alignment.lerp(Alignment.centerLeft, Alignment.center, 0.1)
                    as AlignmentGeometry,
            children: [
              IconTextButton(
                onPressed: onPressed,
                icon: SvgPicture.asset(
                  AppIcons.circle,
                ),
                label: Text(
                  S.of(context).urgent,
                  style: AppStyles.simpleStyle,
                ),
              ),
              urgent == 1
                  ? SvgPicture.asset(
                      AppIcons.choose,
                    )
                  : SvgPicture.asset(
                      AppIcons.circle,
                    ),
            ],
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
