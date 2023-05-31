import 'package:flutter/material.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/controller/home_store.dart';

import '../../../../../core/theme/app_styles.dart';

class CardListEmpty extends StatelessWidget {
  const CardListEmpty({
    super.key,
    required this.controller,
  });
  final HomeStore controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.image_search_outlined,
              size: 80,
            ),
            const SizedBox(height: 12),
            const Text(
              "Nenhum post foi encontrado!",
              style: AppStyles.cardTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                controller.clearTextSearch();
                controller.getInitialPosts();
              },
              child: const Text("Voltar a busca inicial"),
            )
          ],
        ),
      ),
    );
  }
}
