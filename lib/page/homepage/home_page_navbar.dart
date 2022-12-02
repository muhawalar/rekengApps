import 'package:flutter/material.dart';
import 'package:rekeng_apps/material/themes_color.dart';
import 'package:provider/provider.dart';
import 'package:rekeng_apps/provider/rekeng_provider.dart';

class HomePageBottomBar extends StatelessWidget {
  const HomePageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RekengProvider>(context);
    return Scaffold(
      body: model.screens[model.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          onTap: (value) => model.newScreenIndex(value),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  (model.currentIndex == 0)
                      ? Icons.home_rounded
                      : Icons.home_outlined,
                  size: 30,
                  color: ColorApp.primary,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  (model.currentIndex == 1)
                      ? Icons.insert_chart
                      : Icons.insert_chart_outlined_outlined,
                  size: 30,
                  color: ColorApp.primary,
                ),
                label: 'graph'),
            BottomNavigationBarItem(
                icon: Icon(
                  (model.currentIndex == 2)
                      ? Icons.add_box
                      : Icons.add_box_outlined,
                  size: 30,
                  color: ColorApp.primary,
                ),
                label: 'graph'),
            BottomNavigationBarItem(
                icon: Icon(
                  (model.currentIndex == 3)
                      ? Icons.person
                      : Icons.person_outline,
                  size: 30,
                  color: ColorApp.primary,
                ),
                label: 'graph'),
          ]),
    );
  }
}
