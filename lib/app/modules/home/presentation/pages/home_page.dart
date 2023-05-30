import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/controller/home_store.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/widgets/card_post.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/pages/post_detail_page.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';
import 'package:miio_flutter_test/core/widgets/animations/fade_container.dart';
import 'package:miio_flutter_test/main.dart';

import '../widgets/categories_listview.dart';
import '../widgets/home_bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final controller = getIt.get<HomeStore>();
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.getInitialPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Observer(builder: (context) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (!controller.isLoadingNextPage &&
                  scrollInfo.metrics.pixels >
                      scrollInfo.metrics.maxScrollExtent - 50 &&
                  controller.hasMore) {
                controller.nextPage();
              }
              return true;
            },
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  toolbarHeight: 170,
                  expandedHeight: 170,
                  backgroundColor: AppColors.background,
                  clipBehavior: Clip.antiAlias,
                  snap: true,
                  floating: true,
                  pinned: false,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: FadeContainer(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: TextField(
                              decoration:
                                  const InputDecoration(labelText: "Search"),
                              onSubmitted: (newValue) {
                                controller.setCurrentSearch(newValue);
                                controller.getInitialPosts();
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                          CategoriesListView(controller: controller),
                        ],
                      ),
                    ),
                  ),
                ),
                if (controller.isLoadingHomePage)
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else
                  SliverPadding(
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
                  )
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: const HomeBottomNavigation(),
    );
  }
}
