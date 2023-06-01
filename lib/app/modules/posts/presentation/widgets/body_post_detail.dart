import 'package:flutter/material.dart';
import 'package:miio_flutter_test/domain/entities/post_entity.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/animations/fade_container.dart';
import '../../../home/presentation/widgets/card_user.dart';
import 'card_comment.dart';

class BodPostDetail extends StatefulWidget {
  const BodPostDetail({
    super.key,
    required this.post,
    required this.scrollController,
  });
  final PostEntity post;
  final ScrollController scrollController;

  @override
  State<BodPostDetail> createState() => _BodPostDetailState();
}

class _BodPostDetailState extends State<BodPostDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: ListView(
        padding: EdgeInsets.zero,
        controller: widget.scrollController,
        children: [
          Center(
            child: Container(
              height: 5,
              width: 36,
              decoration: BoxDecoration(
                color: AppColors.lighterGray,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Hero(
            tag: widget.post.avatarUrl,
            child: Material(
              color: Colors.transparent,
              child: Text(
                widget.post.title,
                style: AppStyles.postTitle,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            widget.post.text,
            style: AppStyles.postText,
          ),
          const SizedBox(height: 24),
          FadeContainer(
            child: CardUser(
              hideHeroTag: true,
              title: widget.post.title,
              subtitle: widget.post.text,
              avatarUrl: widget.post.avatarUrl,
              decoration: BoxDecoration(
                color: const Color(0xffF9FBFC),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(
            thickness: 1,
            height: 2,
            color: Color(0xffD4D4D4),
          ),
          const SizedBox(height: 24),
          const Text(
            "Comments",
            style: AppStyles.sectionTitle,
          ),
          ...widget.post.comments.map(
            (comment) => CardComment(
              comment: comment,
            ),
          ),
        ],
      ),
    );
  }
}
