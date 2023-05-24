import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoshka/generated/l10n.dart';
import 'package:todoshka/resources/colors.dart';
import 'package:todoshka/resources/icons.dart';
import 'package:todoshka/widgets/buttons/icon_button_wrapper.dart';

class CreatingPage extends StatefulWidget {
  const CreatingPage({super.key});

  static const String routeName = 'pages/create';

  @override
  State<CreatingPage> createState() => _CreatingPageState();
}

class _CreatingPageState extends State<CreatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.gradient,
        ),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButtonWrapper(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppIcons.back,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: S.of(context).nameTask,
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                        )
                      )
                    ),
                    keyboardType: TextInputType.text,
                    //S.of(context).nameTask,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
