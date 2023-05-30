import 'package:flutter/material.dart';
import 'package:miio_flutter_test/core/widgets/animations/fade_container.dart';
import 'package:miio_flutter_test/domain/entities/post_entity.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/widgets/card_user.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/widgets/card_comment.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/widgets/shadow_button.dart';
import 'package:miio_flutter_test/core/managers/manager_icons.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';
import 'package:miio_flutter_test/core/theme/app_styles.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({
    super.key,
    required this.post,
  });

  final PostEntity post;
  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.post.backgroundUrl,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.post.backgroundUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 24,
            width: MediaQuery.of(context).size.width - 48,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadowButton(
                  path: ManagerIcons.iconBack,
                  onTap: () => Navigator.pop(context),
                ),
                const Spacer(),
                Column(
                  children: [
                    ShadowButton(
                      path: ManagerIcons.iconFavorites,
                      onTap: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 8),
                    ShadowButton(
                      path: ManagerIcons.iconShare,
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            maxChildSize: 1,
            minChildSize: 0.5,
            initialChildSize: 0.5,
            builder: (
              context,
              controller,
            ) {
              return SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: ListView(
                    controller: controller,
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
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
