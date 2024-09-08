import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:may_fair/core/theme/color.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function onTap;
  const BottomNavBarWidget(
      {super.key, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.chat,
        Icons.person,
        Icons.drive_eta,
        Icons.menu,
      ],
      activeIndex: selectedIndex,
      activeColor: ColorsManager.mainYellow,
      iconSize: 35,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 25,
      rightCornerRadius: 25,
      onTap: (index) {
        onTap(index);
      },
    );
  }
}
