// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:portfolio/view/screens/Home/pages/addpeoplepage.dart';
import 'package:portfolio/view/screens/Home/pages/homepage.dart';
import 'package:portfolio/view/screens/Home/pages/messagepage.dart';
import 'package:portfolio/view/screens/Home/pages/settingpage.dart';

class MyNavigationBar2 extends StatefulWidget {
  const MyNavigationBar2({super.key});

  @override
  State<MyNavigationBar2> createState() => _MyNavigationBar2State();
}

class _MyNavigationBar2State extends State<MyNavigationBar2> {
  @override
  int _pageIndex = 0;
  List<Widget> _pages = [
    const HomePage(),
    const AddPeoplePage(),
    const MessagePage(),
    const SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      return Stack(children: [
        PageView(
          children: _pages,
        ),
        Padding(
          padding: EdgeInsets.only(
              top: Constraints.maxHeight * 0.02,
              right: Constraints.maxWidth * 0.05,
              left: Constraints.maxWidth * 0.05),
          child: Align(
            alignment: Alignment(0, 1),
            child: Container(
              height: Constraints.maxHeight * 0.08,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(Constraints.maxHeight * 0.032),
                color: Color(0xff323232),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                    size: Constraints.maxHeight * 0.06,
                  ),
                  Icon(Icons.search,
                      color: Colors.white, size: Constraints.maxHeight * 0.06),
                ],
              ),
            ),
          ),
        )
      ]);
    });
  }
}
