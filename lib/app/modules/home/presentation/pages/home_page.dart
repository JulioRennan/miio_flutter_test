import 'package:flutter/material.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/controller/home_store.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/widgets/body_list_posts.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/widgets/actions_buttons_post_detail.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';
import 'package:miio_flutter_test/core/widgets/animations/fade_container.dart';
import 'package:miio_flutter_test/main.dart';

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
        child: NotificationListener<ScrollNotification>(
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
              const SliverAppBar(
                toolbarHeight: 170,
                expandedHeight: 170,
                backgroundColor: AppColors.background,
                clipBehavior: Clip.antiAlias,
                snap: true,
                floating: true,
                pinned: false,
                flexibleSpace: Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: FadeContainer(
                    child: ActionsButtonsPostDetail(),
                  ),
                ),
              ),
              BodyListPosts(controller: controller)
            ],
          ),
        ),
      ),
      bottomNavigationBar: const HomeBottomNavigation(),
    );
  }
}
