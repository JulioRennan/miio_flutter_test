import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/controller/home_store.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/widgets/card_post.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/pages/post_detail_page.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';
import 'package:miio_flutter_test/main.dart';

import '../widgets/home_bottom_navigation.dart';
import '../widgets/chips_options.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final controller = getIt.get<HomeStore>();

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              TextField(
                decoration: const InputDecoration(labelText: "Search"),
                onSubmitted: (newValue) {
                  log("new value ${newValue}");
                  controller.setCurrentSearch(newValue);
                  controller.getInitialPosts();
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                height: 50,
                child: Observer(
                  builder: (context) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: controller.categories
                          .map(
                            (category) => ChipsOptions(
                              title: category,
                              isSelected:
                                  controller.currentCategory == category,
                              onTap: () {
                                controller.setCategory(category);
                              },
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (context) {
                    if (controller.isLoadingHomePage) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Observer(
                      builder: (context) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.listPosts.length + 1,
                          itemBuilder: (context, index) {
                            if (controller.listPosts.length == index) {
                              if (controller.hasMore) {
                                controller.nextPage();
                              }
                              if (controller.isLoadingNextPage) {
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
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottomNavigation(),
    );
  }
}
