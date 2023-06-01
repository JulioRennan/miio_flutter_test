import 'package:flutter/material.dart';

import '../../../../../core/theme/app_styles.dart';

class SectionAction extends StatelessWidget {
  const SectionAction({
    super.key,
    required this.title,
    required this.pathAsset,
  });
  final String pathAsset;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          pathAsset,
          width: 20,
        ),
        const SizedBox(width: 9),
        Text(
          title,
          style: AppStyles.sectionActions,
        )
      ],
    );
  }
}
