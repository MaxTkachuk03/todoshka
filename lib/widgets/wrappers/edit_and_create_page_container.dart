import 'package:flutter/material.dart';
import 'package:todoshka/resources/resources.dart';

class EditAndCreatePageContainer extends StatelessWidget {
  const EditAndCreatePageContainer({
    super.key,
    required this.child,
    required this.height,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: AppColors.beige,
      child: child,
    );
  }
}
