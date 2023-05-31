import 'package:flutter/material.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/widgets/actions_buttons_post_detail.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/widgets/body_post_detail.dart';
import 'package:miio_flutter_test/domain/entities/post_entity.dart';

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
            child: const ActionsButtonsPostDetail(),
          ),
          DraggableScrollableSheet(
            maxChildSize: 1,
            minChildSize: 0.5,
            initialChildSize: 0.5,
            builder: (
              context,
              scrollController,
            ) =>
                BodPostDetail(
              post: widget.post,
              scrollController: scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
