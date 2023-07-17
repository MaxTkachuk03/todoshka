
import 'package:flutter/material.dart';
import 'package:todoshka/resources/colors.dart';
import 'package:todoshka/resources/fonts.dart';

class AppStyles {
  const AppStyles._();

  static const TextStyle mainStyle = TextStyle(
    color: AppColors.blackSecond,
    fontWeight: AppFonts.bold,
    fontSize: 24.0,
    fontFamily: AppFonts.fontFamily,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle simpleStyle = TextStyle(
    color: AppColors.blackSecond,
    fontWeight: AppFonts.bold,
    fontSize: 18.0,
    fontFamily: AppFonts.fontFamily,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle buttonStyle = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.fontFamily,
    fontWeight: AppFonts.normal,
  );
}

