import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static final  pacifico400style64 = TextStyle(
    fontSize: 64,
    fontWeight: FontWeight.w400,
    color: AppColors.deepBrown,
    fontFamily: kPacificoFontFamily,
  );
  static final  poppins400style64 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.deepBrown,
    fontFamily: kPoppinsFontFamily,
  );
  static final  poppins500style24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: kPoppinsFontFamily,
  );
  static final  poppins500style18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.offWhite,
    fontFamily: kPoppinsFontFamily,
  );
  static final  poppins300style16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
    fontFamily: kPoppinsFontFamily,
  );
}
