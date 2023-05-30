import 'package:flutter/material.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/widgets/card_user.dart';

class CardPost extends StatelessWidget {
  const CardPost({
    super.key,
    required this.title,
    required this.subtitle,
    required this.avatarUrl,
    required this.backgroundUrl,
    this.onTap,
  });
  final String title;
  final String subtitle;
  final String avatarUrl;
  final String backgroundUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Hero(
              tag: "backgroundImage",
              child: Container(
                height: 220,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(backgroundUrl),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 180,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                alignment: Alignment.center,
                child: CardUser(
                  avatarUrl: avatarUrl,
                  subtitle: subtitle,
                  title: title,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
