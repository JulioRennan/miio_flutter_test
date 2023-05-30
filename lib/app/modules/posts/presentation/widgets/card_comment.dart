import 'package:flutter/material.dart';
import 'package:miio_flutter_test/app/domain/entities/comment.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/widgets/stars_comments.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class CardComment extends StatelessWidget {
  const CardComment({
    super.key,
    required this.comment,
  });
  final CommentEntity comment;
  @override
  Widget build(BuildContext context) {
    print("Buidando ${DateTime.now()}");
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffC4C4C4).withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StartComments(rate: comment.rate),
          const SizedBox(height: 8),
          Text(
            comment.title,
            style: AppStyles.cardSectionTitle,
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: AppStyles.cardSectionSubtitle,
              text: "Reviewed by ",
              children: [
                TextSpan(
                  text: comment.reviewerNickname,
                  style: const TextStyle(
                    color: AppColors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
