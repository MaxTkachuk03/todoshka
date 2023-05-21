import 'package:flutter/cupertino.dart';

class AppColors {
  const AppColors._();

  static const gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromRGBO(169, 169, 169, 1),
      Color.fromRGBO(56, 56, 56, 1),
    ],
  );

  static const yellow = Color.fromRGBO(255, 214, 0, 1);
  static const black = Color.fromRGBO(0, 0, 0, 1);
}
