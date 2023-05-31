import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/controller/home_store.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/widgets/card_connection_error.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/widgets/card_list_empty.dart';

import '../../../posts/presentation/pages/post_detail_page.dart';
import 'card_post.dart';

class BodyListPosts extends StatelessWidget {
  const BodyListPosts({
    super.key,
    required this.controller,
  });
  final HomeStore controller;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (controller.hasError) {
          return SliverFillRemaining(
            child: CardConnectionError(
              onRefresh: controller.getInitialPosts,
            ),
          );
        }
        return Observer(
          builder: (context) {
            if (controller.isLoadingHomePage) {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (controller.listPosts.isEmpty) {
              return SliverFillRemaining(
                child: Center(
                  child: CardListEmpty(controller: controller),
                ),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: Observer(
                builder: (context) {
                  final isLoadingNextPage = controller.isLoadingNextPage;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: controller.listPosts.length + 1,
                      (context, index) {
                        if (controller.listPosts.length == index) {
                          if (isLoadingNextPage) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return const SizedBox.shrink();
                        }
                        final post = controller.listPosts[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: CardPost(
                            title: post.title,
                            subtitle: post.text,
                            avatarUrl: post.avatarUrl,
                            backgroundUrl: post.backgroundUrl,
                            onTap: () => Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(
                                  milliseconds: 500,
                                ),
                                pageBuilder: (context, _, __) =>
                                    PostDetailPage(post: post),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
