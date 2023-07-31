import 'package:flutter/material.dart';

DateTime selectedDate = DateTime.now();

Future<void> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 1),
      lastDate: DateTime(2050));

  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
  }
}
