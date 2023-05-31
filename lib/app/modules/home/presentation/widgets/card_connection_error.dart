import 'package:flutter/material.dart';

import '../../../../../core/theme/app_styles.dart';

class CardConnectionError extends StatelessWidget {
  const CardConnectionError({
    super.key,
    required this.onRefresh,
  });

  final Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.warning_amber_rounded,
            size: 80,
          ),
          const SizedBox(height: 12),
          const Text(
            "Não foi possível carregar os posts no momento, tente novamente mais tarde!",
            style: AppStyles.cardTitle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: onRefresh,
            child: const Text("Recarregar agora!"),
          )
        ],
      ),
    );
  }
}
