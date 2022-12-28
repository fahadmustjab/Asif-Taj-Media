import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tech_media/res/color.dart';
import 'package:tech_media/view/Dashboard/profile.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final controller = PersistentTabController(initialIndex: 0);

  _buildScreen() {
    return [
      Text('HOme'),
      Text('HOm'),
      Text('HOm'),
      Text('HOe'),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _NavBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
        ),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(
          Icons.home,
          color: Colors.grey.shade100,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.message,
        ),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(
          Icons.message,
          color: Colors.grey.shade100,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.add,
          color: Colors.grey.shade100,
        ),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(
          Icons.add,
          color: Colors.grey.shade100,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person,
        ),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(
          Icons.person,
          color: Colors.grey.shade100,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.settings,
        ),
        activeColorPrimary: AppColors.primaryIconColor,
        inactiveIcon: Icon(
          Icons.settings,
          color: Colors.grey.shade100,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _NavBarItems(),
      controller: controller,
      backgroundColor: AppColors.otpHintColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
