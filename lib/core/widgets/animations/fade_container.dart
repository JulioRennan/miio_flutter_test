import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FadeContainer extends StatefulWidget {
  const FadeContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  State<FadeContainer> createState() => _FadeContainerState();
}

class _FadeContainerState extends State<FadeContainer> {
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() {
          isVisible = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1 : 0,
      duration: const Duration(milliseconds: 1000),
      child: widget.child,
    );
  }
}
