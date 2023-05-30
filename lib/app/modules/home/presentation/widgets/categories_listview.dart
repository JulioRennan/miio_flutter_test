import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/controller/home_store.dart';

import 'chips_options.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.controller,
  });
  final HomeStore controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return ChipsOptions(
            margin:
                index == 0 ? const EdgeInsets.only(right: 10, left: 24) : null,
            title: category,
            isSelected: controller.currentCategory == category,
            onTap: () {
              controller.setCategory(category);
            },
          );
        },
      ),
    );
  }
}
