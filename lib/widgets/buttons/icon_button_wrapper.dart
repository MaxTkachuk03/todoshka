import 'package:flutter/material.dart';

class IconButtonWrapper extends StatelessWidget {
  const IconButtonWrapper({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final Widget icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
    );
  }
}
