import 'package:flutter/material.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';

class ChipsOptions extends StatelessWidget {
  const ChipsOptions({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.margin,
  });
  final bool isSelected;
  final String title;
  final void Function() onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        margin: margin??const EdgeInsets.only(right: 10, left: 2),
        duration: const Duration(milliseconds: 300),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF0F9FC) : AppColors.background,
          border: Border.all(
            color: isSelected
                ? const Color(0xffA1D2E5)
                : AppColors.lightGrayAlternative,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected
                      ? AppColors.black
                      : AppColors.lightGrayAlternative,
                ),
                child: Text(title),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
