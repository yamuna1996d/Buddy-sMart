import 'package:buddymart/Screens/FrshVegitables.dart';
import 'package:buddymart/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List pages=[
    const HomePage(),
    const FreshVegetables(),
    const HomePage(),
    const FreshVegetables(),
    const HomePage(),
  ];
  int currentIndex =0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/Icons/home.svg"),
            label: "",
            activeIcon: SvgPicture.asset("assets/Icons/homecolored.svg")
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/Icons/search.svg"),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/Icons/shop.svg"),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/Icons/category.svg"),
              activeIcon: SvgPicture.asset("assets/Icons/categorycolored.svg"),
              label: ""),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/Icons/person.svg"),
              label: "")
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
