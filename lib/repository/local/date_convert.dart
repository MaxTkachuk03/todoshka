import 'package:flutter/material.dart';

DateTime selectedDate = DateTime.now();

Future<DateTime> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      currentDate: selectedDate,
      firstDate: DateTime(2015, 1),
      lastDate: DateTime(2050));

  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
     return selectedDate;
  }
  return selectedDate;
}
