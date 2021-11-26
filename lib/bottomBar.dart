// ignore_for_file: file_names

import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomBarC extends StatelessWidget {
  final int currentPage;
  final PageController pageController;
  final Function(int) notifyParent;
  const BottomBarC(
      {Key? key,
      required this.currentPage,
      required this.pageController,
      required this.notifyParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      selectedIndex: currentPage,
      onTap: (int index) {
        pageController.jumpToPage(index);
        notifyParent(index);
      },
      items: <BottomBarItem>[
        BottomBarItem(
            icon: Icon(Icons.home),
            title: Text("home"),
            activeColor: Colors.blue),
        BottomBarItem(
            icon: Icon(Icons.accessibility),
            title: Text("Doctors"),
            activeColor: Colors.red),
        BottomBarItem(
            icon: Icon(Icons.chat_bubble),
            title: Text("Chat"),
            activeColor: Colors.green),
        BottomBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            title: Text("Booking"),
            activeColor: Colors.orange),
        BottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            activeColor: Colors.purple)
      ],
    );
  }
}
