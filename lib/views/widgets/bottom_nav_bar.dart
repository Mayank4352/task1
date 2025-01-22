import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stroll/views/home.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Home(),
    Center(
        child: Text("Discover Page",
            style: TextStyle(color: Colors.white, fontSize: 18.sp))),
    Center(
        child: Text("Chats Page",
            style: TextStyle(color: Colors.white, fontSize: 18.sp))),
    Center(
        child: Text("Profile Page",
            style: TextStyle(color: Colors.white, fontSize: 18.sp))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              child: Image.asset(
                'assets/icons/cards.png',
                height: 4.h,
                color:
                    _currentIndex == 0 ? const Color(0xFF8B5CF6) : Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              child: Image.asset(
                'assets/icons/discover.png',
                height: 4.h,
                color:
                    _currentIndex == 1 ? const Color(0xFF8B5CF6) : Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              child: Image.asset(
                'assets/icons/chats.png',
                height: 4.h,
                color:
                    _currentIndex == 2 ? const Color(0xFF8B5CF6) : Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              child: Image.asset(
                'assets/icons/profile.png',
                height: 4.h,
                color:
                    _currentIndex == 3 ? const Color(0xFF8B5CF6) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
