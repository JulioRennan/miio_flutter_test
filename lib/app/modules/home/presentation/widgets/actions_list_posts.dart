import 'package:flutter/material.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/controller/home_store.dart';

import 'categories_listview.dart';

class ActionsListPost extends StatelessWidget {
  const ActionsListPost({
    super.key,
    required this.controller,
  });
  final HomeStore controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextField(
            decoration: const InputDecoration(labelText: "Search"),
            onSubmitted: (newValue) {
              controller.setCurrentSearch(newValue);
              controller.getInitialPosts();
            },
          ),
        ),
        const SizedBox(height: 24),
        CategoriesListView(controller: controller),
      ],
    );
  }
}
