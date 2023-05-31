
import 'package:flutter/material.dart';
import 'package:miio_flutter_test/app/modules/home/presentation/widgets/home_bottom_item.dart';
import 'package:miio_flutter_test/core/managers/manager_icons.dart';
import 'package:miio_flutter_test/core/theme/app_colors.dart';

class HomeBottomNavigation extends StatefulWidget {
  const HomeBottomNavigation({super.key});

  @override
  State<HomeBottomNavigation> createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.background,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeBottomItem(
              pathAsset: ManagerIcons.iconHome,
              isSelected: currentIndex == 0,
              onTap: () {
                setIndex(0);
              },
            ),
            const SizedBox(width: 35),
            HomeBottomItem(
              pathAsset: ManagerIcons.iconFavorites,
              isSelected: currentIndex == 1,
              onTap: () {
                setIndex(1);
              },
            ),
            const SizedBox(width: 35),
            HomeBottomItem(
              pathAsset: ManagerIcons.iconShop,
              isSelected: currentIndex == 2,
              onTap: () {
                setIndex(2);
              },
            ),
            const SizedBox(width: 35),
            HomeBottomItem(
              pathAsset: ManagerIcons.iconAccount,
              isSelected: currentIndex == 3,
              onTap: () {
                setIndex(3);
              },
            ),
          ],
        ),
      ),
    );
  }

  setIndex(int value) {
    setState(() {
      currentIndex = value;
    });
  }
}
