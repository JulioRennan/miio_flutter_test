import 'package:flutter/material.dart';

class StartComments extends StatefulWidget {
  const StartComments({
    super.key,
    required this.rate,
  });
  final int rate;
  @override
  State<StartComments> createState() => _StartCommentsState();
}

class _StartCommentsState extends State<StartComments> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: IconTheme(
        data: const IconThemeData(size: 24, color: Color(0xff66C2E9)),
        child: Stack(
          children: [
            ...List.generate(
              widget.rate,
              (index) => Positioned(
                left: index * 30,
                child: const Icon(
                  Icons.star,
                ),
              ),
            ),
            ...List.generate(
              5,
              (index) => Positioned(
                left: index * 30,
                child: const Icon(
                  Icons.star_outline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
