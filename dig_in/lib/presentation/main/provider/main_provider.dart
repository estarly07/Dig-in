import 'package:flutter/material.dart';

class MainProvider extends InheritedWidget {
  final String currentPage;
  final Function(String) onClickNavigation;

  MainProvider({
    required this.currentPage,
    required this.onClickNavigation,
    required Widget child,
    Key? key,
  }) : super(child: child);
  @override
  bool updateShouldNotify(MainProvider oldWidget) => true;
  static MainProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MainProvider>()!;
}
