// ignore_for_file: prefer_const_constructors

import 'package:dailydoc/constants/colors.dart';
import 'package:dailydoc/ui/bottom_bar/empty_screen.dart';
import 'package:dailydoc/ui/home/whatapp_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    // Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    WhatAppHome(),
    EmptyPage(
      text: Text('Find Patient',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.menu),
      //   title: Text('Page title'),
      //   actions: [
      //     Icon(Icons.favorite),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 16),
      //       child: Icon(Icons.search),
      //     ),
      //     Icon(Icons.more_vert),
      //   ],
      //   backgroundColor: Colors.purple,
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              // activeIcon: Icon(
              //   Icons.home,
              // ),
              label: 'Home',
              backgroundColor: AppColors.appBaground,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Find patient',
              backgroundColor: AppColors.appBaground,
            ),
          ],
          // type: BottomNavigationBarType.shifting,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.indigo.shade500,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade400,
          iconSize: 30.h,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
