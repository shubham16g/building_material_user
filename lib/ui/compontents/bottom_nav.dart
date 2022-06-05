

import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {

  final Function(int index) onChange;
  const BottomNav({Key? key, required this.onChange}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      selectedIndex: _currentIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _currentIndex = index;
          widget.onChange(index);
        });
      },
      destinations: const [
        NavigationDestination(icon: Icon(
          Icons.home,
        ), label: 'Home'),
        NavigationDestination(icon: Icon(
          Icons.category,
        ), label: 'Category'),
        NavigationDestination(icon: Icon(
          Icons.favorite,
        ), label: 'Favorite'),
        NavigationDestination(icon: Icon(
          Icons.person,
        ), label: 'Profile'),
      ],
    );
  }
}
