import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class ShadowButton extends StatelessWidget {
  const ShadowButton({
    super.key,
    required this.path,
    required this.onTap,
  });
  final String path;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Material(
        color: AppColors.black.withOpacity(.22),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(path),
          ),
        ),
      ),
    );
  }
}
