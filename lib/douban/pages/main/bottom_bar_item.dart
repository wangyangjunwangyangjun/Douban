import 'package:flutter/material.dart';

class HYBottomBarItem extends BottomNavigationBarItem {
  HYBottomBarItem(String iconName, String title)
      : super(
            icon: Image.asset(
              "assets/images/tabbar/${iconName}.png",
              width: 30,
            ),
            label: title,
            activeIcon: Image.asset(
              "assets/images/tabbar/${iconName}_fill.png",
              width: 30,
            ));
}
