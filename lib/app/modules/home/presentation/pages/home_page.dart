import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/controller/home_store.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/widgets/card_post.dart';
import 'package:miio_flutter_test/app/modules/posts/presentation/pages/post_detail_page.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';
import 'package:miio_flutter_test/main.dart';

import '../widgets/chips_options.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = getIt.get<HomeStore>();

  @override
  void initState() {
    super.initState();
    controller.getPosts();
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
              const TextField(
                decoration: InputDecoration(labelText: "Search"),
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
                child: Observer(builder: (context) {
                  if (controller.isLoadingHomePage) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.listPosts.length,
                    itemBuilder: (context, index) {
                      final post = controller.listPosts[index];
                      return CardPost(
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
                      );
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
