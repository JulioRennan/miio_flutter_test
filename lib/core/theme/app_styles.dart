import 'package:flutter/material.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';

class AppStyles {
  static const label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.lightGray,
  );
  static const cardTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static const postTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(34, 34, 34, 1),
  );
  static const postText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xffA9A9A9),
  );

  static const sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static const cardSectionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static const cardSectionSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xffA9A9A9),
  );
}
