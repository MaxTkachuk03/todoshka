import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/resources.dart';
import 'package:todoshka/widgets/widgets.dart';

class ChooseType extends StatelessWidget {
  const ChooseType({
    super.key,
    required this.containerHeiht,
    required this.onPressed,
    required this.onPressed2,
    required this.counter,
  });

  final double containerHeiht;
  final void Function() onPressed;
  final void Function() onPressed2;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return EditAndCreatePageContainer(
      height: containerHeiht,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButtonWrapper(
                onPressed: onPressed,
                icon: SvgPicture.asset(
                  AppIcons.circle,
                ),
              ),
              counter == 1
                  ? SvgPicture.asset(
                      AppIcons.choose,
                    )
                  : Container(),
            ],
          ),
          Text(
            S.of(context).works,
            style: AppStyles.simpleStyle,
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButtonWrapper(
                onPressed: onPressed2,
                icon: SvgPicture.asset(
                  AppIcons.circle,
                ),
              ),
              counter == 2
                  ? SvgPicture.asset(
                      AppIcons.choose,
                    )
                  : Container(),
            ],
          ),
          Text(
            S.of(context).personal,
            style: AppStyles.simpleStyle,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
