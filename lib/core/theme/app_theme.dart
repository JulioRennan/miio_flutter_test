import 'package:flutter/material.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';
import 'package:miio_flutter_test/core/theme/app_styles.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.darkGray,
    background: AppColors.background,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: AppStyles.label,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 12,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: AppColors.lightGrayAlternative,
      ),
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.5,
        color: AppColors.lightGrayAlternative,
      ),
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  ),
);
