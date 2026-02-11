import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  const CustomFormTextField(
      {super.key,
      required this.labelText,
      this.controller,
      this.isPasswordTextField = false});
  final String labelText;
  final TextEditingController? controller;
  final bool isPasswordTextField;

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
   bool obscureText = true;


  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: widget.isPasswordTextField ? obscureText : false,
        obscuringCharacter: "●",
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isPasswordTextField 
              ? IconButton(
                  icon: Icon(
                   obscureText ? Icons.visibility_outlined :  Icons.visibility_off_outlined,
                    color: AppColors.grey,
                  ),
                  onPressed: toggleObscureText,
                )
              : null,
          labelText: widget.labelText,
          labelStyle: AppTextStyles.poppins500style16,
          border: OutlineInputBorder(),
          enabledBorder: getBorderStyle(),
          focusedBorder: getBorderStyle(),
        ),
      ),
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(color: AppColors.grey, width: 1),
  );
}
