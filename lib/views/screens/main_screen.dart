

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/colors.dart';
import 'package:noize_app/utils/device_utils.dart';
import 'package:noize_app/views/screens/explore.dart';
import 'package:noize_app/views/screens/favorite.dart';
import 'package:noize_app/views/screens/home.dart';
import 'package:noize_app/views/screens/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pages = [Home(), Explore(), Favorite(), Profile()];
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;

  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = DeviceUtils.getScreenWidth(context);
    final double screenHeight = DeviceUtils.getScreenHeight(context);
    
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.08, right: screenWidth * 0.08, bottom: 36),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(36),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: BottomNavigationBar(
              onTap: (value){
                setState((){
                  currentIndex = value;
                });
              },
              currentIndex: currentIndex,
              elevation: 0,
                selectedItemColor: NoizeColors.ultraMarine,
                unselectedItemColor: Theme.of(context).colorScheme.primary,
                selectedLabelStyle: TextStyle(fontSize: 12),
                showSelectedLabels: true,
                showUnselectedLabels: false,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.headphones,
                      ),
                      label: "Home"),
                      BottomNavigationBarItem(
                      icon: Icon(
                        Icons.explore,
                      ),
                      label: "Explore"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite,
                      ),
                      label: "Favorites"),
                  BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person,
                        ),
                        label: "Profile"),
                 
                     
                ]),
          ),
        ),
      ),

      body: pages[currentIndex],
    );
  }
}
