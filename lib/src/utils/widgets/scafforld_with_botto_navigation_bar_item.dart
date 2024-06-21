import 'package:flutter/material.dart';
import 'package:ustawi/src/routing/app_routes.dart';

class ScaffoldWithBottomNavigationBarItem extends NavigationDestination {
  const ScaffoldWithBottomNavigationBarItem(
      {super.key,
      required this.route,
      required super.icon,
      required Widget super.selectedIcon,
      required super.label});
  final AppRoute route;

  // String get location =>
  //     GoRouter.of(context).namedLocation(initialRouteName.name);
}
