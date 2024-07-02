//create Bottom Nav Bar
import 'package:flutter/material.dart';
import 'package:gembay/screen/communities_page.dart';
import 'package:gembay/screen/home_page.dart';
import 'package:gembay/screen/my_account_page.dart';
import 'package:gembay/screen/my_trips_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  List screens = [
    const HomePage(),
    const MyTripsPage(),
    const CommunitiesPage(),
    const MyAccountsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xffFF7610),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_document),
              label: 'My Trips',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Communities',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Account',
            ),
          ],
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
