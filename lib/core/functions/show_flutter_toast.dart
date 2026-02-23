import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showFlutterToast({required String message, Color? backgroundColor}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER_LEFT,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? AppColors.primaryColor,
      textColor: AppColors.white,
      fontSize: 16.0);
}
