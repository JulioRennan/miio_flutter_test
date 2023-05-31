import 'package:flutter/material.dart';

import '../../../../../core/managers/manager_icons.dart';
import 'shadow_button.dart';

class ActionsButtonsPostDetail extends StatelessWidget {
  const ActionsButtonsPostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShadowButton(
          path: ManagerIcons.iconBack,
          onTap: () => Navigator.pop(context),
        ),
        const Spacer(),
        Column(
          children: [
            ShadowButton(
              path: ManagerIcons.iconFavorites,
              onTap: () {},
            ),
            const SizedBox(height: 8),
            ShadowButton(
              path: ManagerIcons.iconShare,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
