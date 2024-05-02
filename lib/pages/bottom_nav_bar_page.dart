import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:todo/pages/add_page.dart';
import 'package:todo/pages/calendar_page.dart';
import 'package:todo/pages/document_page.dart';
import 'package:todo/pages/profile_page.dart';

import 'home_page.dart';

class BottomNavBarPage extends StatefulWidget {
  static const String id = "faas";

  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  List<IconData> iconList = [
    IconlyBold.home,
    IconlyBold.calendar,
    IconlyBold.paper,
    IconlyBold.profile
  ];

  int _bottomNavIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: [
          HomePage(),
          CalendarPage(),
          DocumentPage(),
          ProfilePage(),
        ],
        onPageChanged: (int index) {
          setState(
            () {
              _bottomNavIndex = index;
              pageController = PageController(initialPage: index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            pageController = PageController(initialPage: 1);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => AddPage()));
          });
        },
        focusElevation: 50,
        splashColor: Colors.yellow.withOpacity(0.5),
        hoverColor: Colors.yellow,
        focusColor: Colors.cyan,
        backgroundColor: const Color(0xff5f33e1),
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
          shadows: [Shadow(offset: Offset.fromDirection(1), blurRadius: 10)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: const Color(0xffeee9ff).withOpacity(0.6),
          leftCornerRadius: 34,
          rightCornerRadius: 34,
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchMargin: 10,
          activeColor: const Color(0xff5f33e1),
          inactiveColor: const Color(0xffb5a0f3),
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
              pageController.jumpToPage(index);
            });
          }
          //other params
          ),
    );
  }
}
