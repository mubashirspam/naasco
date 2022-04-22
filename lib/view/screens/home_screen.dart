import 'package:flutter/material.dart';
import 'package:naasco_mart/utlis/app_constants.dart';
import 'package:naasco_mart/view/screens/profile.dart';

import '../widgets/home_page_body.dart';
import '../widgets/appbar.dart';

class HomePage extends StatefulWidget {
  final String? email;
  const HomePage({Key? key, this.email}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePageBody(),
    Text(
      'Index 1: Order',
    ),
    ProfilePage(),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 110,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x1977b86c),
                blurRadius: 27,
                offset: Offset(0, -4),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(42),
              topRight: Radius.circular(42),
            ),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                _selectedIndex = 0;
              }),
              child: navigationItem(
                Icons.home_rounded,
                _selectedIndex == 0
                    ? AppColor.mainColor
                    : AppColor.secondaryColor,
                _selectedIndex == 0 ? Colors.white : AppColor.mainColor,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _selectedIndex = 1;
              }),
              child: navigationItem(
                Icons.feed_rounded,
                _selectedIndex == 1
                    ? AppColor.mainColor
                    : AppColor.secondaryColor,
                _selectedIndex == 1 ? Colors.white : AppColor.mainColor,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _selectedIndex = 2;
              }),
              child: navigationItem(
                Icons.person_rounded,
                _selectedIndex == 2
                    ? AppColor.mainColor
                    : AppColor.secondaryColor,
                _selectedIndex == 2 ? Colors.white : AppColor.mainColor,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 30,
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            MyAppBar(
              logo: _selectedIndex == 0 ? true : false,
              title: _selectedIndex == 0
                  ? "Naasco Mart"
                  : _selectedIndex == 1
                      ? "Orders"
                      : "Profile",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: _widgetOptions.elementAt(_selectedIndex,),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget navigationItem(IconData iconData, Color bxColor, iconColor) =>
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          color: bxColor,
        ),
        child: Center(
          child: Icon(
            iconData,
            color: iconColor,
          ),
        ),
      );
}
