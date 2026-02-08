import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.onChange, required this.value});
  final bool value;
  final ValueChanged<bool> onChange;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        side: BorderSide(
          color: AppColors.grey,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        value: value,
        onChanged: (newValue) {
          onChange(newValue ?? false);
        });
  }
}
