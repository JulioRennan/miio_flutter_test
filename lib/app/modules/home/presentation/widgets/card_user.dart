import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    super.key,
    required this.title,
    required this.subtitle,
    required this.avatarUrl,
    this.decoration,
    this.hideHeroTag = false,
  });
  final String title;
  final String subtitle;
  final String avatarUrl;
  final Decoration? decoration;
  final bool hideHeroTag;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: decoration ??
          BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: 10,
                color: Colors.black.withOpacity(.05),
                offset: const Offset(0, 2),
              )
            ],
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(avatarUrl),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: hideHeroTag ? DateTime.now().toString() : avatarUrl,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      title,
                      maxLines: 2,
                      style: AppStyles.cardTitle,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  maxLines: 1,
                  style: AppStyles.label,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
