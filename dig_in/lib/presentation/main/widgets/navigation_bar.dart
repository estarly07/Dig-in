import 'package:flutter/material.dart';

import '../../routes.dart';
import '../provider/main_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  final items = [
    _ItemNavigationModel(Icons.home_filled, Screens.home),
    _ItemNavigationModel(Icons.favorite_border_rounded, "sad"),
    _ItemNavigationModel(Icons.search, "a"),
    _ItemNavigationModel(Icons.notifications_none_sharp, "sad"),
    _ItemNavigationModel(Icons.shopping_bag_outlined, "asd"),
  ];
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...items
                .map(
                  (e) => InkWell(
                    onTap: () => MainProvider.of(context)
                        .onClickNavigation(e.currentPage),
                    child: _ItemNavigationBar(
                      check:
                          e.currentPage == MainProvider.of(context).currentPage,
                      icon: e.icon,
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

class _ItemNavigationModel {
  final IconData icon;
  final String currentPage;
  _ItemNavigationModel(this.icon, this.currentPage);
}

class _ItemNavigationBar extends StatelessWidget {
  final bool check;
  final IconData icon;

  const _ItemNavigationBar({
    Key? key,
    required this.icon,
    required this.check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return check
        ? Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.orange.shade900,
              elevation: 0,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.shade900.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 8,
                          offset: Offset(1, 5),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Icon(
            icon,
            color: Colors.grey.shade400,
          );
  }
}
