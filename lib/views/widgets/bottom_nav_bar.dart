import 'package:flutter/material.dart';
import 'package:messenger/viewmodels/bottom_nav_model.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final navItems = [
    const NavigationDestination(
      label: "Home",
      tooltip: "Home",
      icon: Icon(Icons.home_outlined),
    ),
    const NavigationDestination(
      label: "Messages",
      tooltip: "Messages",
      icon: Icon(Icons.messenger_outline),
    ),
    const NavigationDestination(
      label: "Settings",
      tooltip: "Settings",
      icon: Icon(Icons.settings_outlined),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavModel>(builder: (context, model, child) {
      return NavigationBar(
        selectedIndex: model.currentIndex,
        onDestinationSelected: model.setNewIndex,
        destinations: navItems,
      );
    });
  }
}
