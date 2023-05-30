import 'package:flutter/material.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';
import 'package:miio_flutter_test/core/theme/app_styles.dart';

class CardPost extends StatelessWidget {
  const CardPost({
    super.key,
    required this.title,
    required this.subtitle,
    required this.avatarUrl,
    required this.backgroundUrl,
    this.onTap,
  });
  final String title;
  final String subtitle;
  final String avatarUrl;
  final String backgroundUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            height: 220,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(backgroundUrl),
              ),
            ),
          ),
          Positioned.fill(
            top: 130,
            child: Center(
              child: Container(
                width: 300,
                height: 75,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 10,
                      color: Colors.black.withOpacity(.05),
                      offset: Offset(0, 2),
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
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            title,
                            maxLines: 2,
                            style: AppStyles.cardTitle,
                          ),
                          SizedBox(height: 4),
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
