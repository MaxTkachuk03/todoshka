import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.label,
  });

  final Widget icon;
  final Widget label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon,
      onPressed: onPressed,
      label: label,
    );
  }
}
