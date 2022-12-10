import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:rekeng_apps/page/scan/scan_ai.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';
import 'package:provider/provider.dart';

class PersistentNavBar extends StatelessWidget {
  const PersistentNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
            inactiveIcon: Icon(Icons.home_outlined),
            icon: Icon(
              Icons.home_rounded,
              size: 30,
            ),
            activeColorPrimary: ColorApp.primary,
            inactiveColorPrimary: ColorApp.grey),
        PersistentBottomNavBarItem(
            inactiveIcon: Icon(Icons.insert_chart_outlined_outlined),
            icon: Icon(
              Icons.insert_chart,
              size: 30,
            ),
            activeColorPrimary: ColorApp.primary,
            inactiveColorPrimary: ColorApp.grey),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.camera_alt_outlined,
            size: 30,
            color: ColorApp.white,
            // color: backgroundColor,
          ),
          onPressed: (p0) {
            model.getImageFromCamera();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanML(),
                ));
            // model.readTextFromAnImage();
          },

          activeColorPrimary: ColorApp.primary,
          // textStyle: primaryTextStyle.copyWith(fontWeight: semiBold),
          // inactiveColorPrimary: secondaryTextColor,
        ),
        PersistentBottomNavBarItem(
            inactiveIcon: Icon(Icons.add_box_outlined),
            icon: Icon(
              Icons.add_box,
              size: 30,
            ),
            activeColorPrimary: ColorApp.primary,
            inactiveColorPrimary: ColorApp.grey
            // textStyle: primaryTextStyle.copyWith(fontWeight: semiBold),
            // activeColorPrimary: primaryColor,
            // inactiveColorPrimary: secondaryTextColor,
            ),
        PersistentBottomNavBarItem(
            inactiveIcon: Icon(Icons.person_outline),
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            activeColorPrimary: ColorApp.primary,
            inactiveColorPrimary: ColorApp.grey),
      ];
    }

    return PersistentTabView(
      context,
      onItemSelected: (value) {
        print(value);
      },

      navBarHeight: 65,
      controller: model.controller,
      screens: model.screens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
          boxShadow: [
            BoxShadow(
                color: ColorApp.black.withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 3,
                blurStyle: BlurStyle.outer)
          ]),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
