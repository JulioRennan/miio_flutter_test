import 'package:flutter/material.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';

class HomeBottomItem extends StatefulWidget {
  const HomeBottomItem({
    super.key,
    required this.pathAsset,
    this.isSelected = false,
    this.onTap,
  });
  final String pathAsset;
  final void Function()? onTap;
  final bool isSelected;

  @override
  State<HomeBottomItem> createState() => _HomeBottomItemState();
}

class _HomeBottomItemState extends State<HomeBottomItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _controller.addListener(() {
      setState(() {});
    });

    _animation = _controller.drive(
      Tween<double>(
        begin: 0,
        end: 1,
      ),
    );

    if (widget.isSelected) {
      _controller.forward(from: 0);
    } else {
      _controller.reverse(from: 1);
    }
  }

  @override
  void didUpdateWidget(covariant HomeBottomItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 20,
            height: 20,
            child: Stack(
              children: [
                Image.asset(
                  widget.pathAsset,
                  width: 20,
                  height: 20,
                  color: AppColors.lightGray,
                ),
                AnimatedBuilder(
                  animation: _animation,
                  child: ClipRRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: _animation.value,
                      child: Image.asset(
                        widget.pathAsset,
                        width: 20,
                        height: 20,
                        color: const Color(0xff66C2E9),
                      ),
                    ),
                  ),
                  builder: (context, child) {
                    return child!;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
