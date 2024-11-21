import 'package:flutter/material.dart';
import 'package:goodfilms/screens/coming_soon_screen.dart';
import 'package:goodfilms/screens/home_screen.dart';
import 'package:goodfilms/screens/search_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 30, 40, 48),
          height: 70,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.search),
              ),
              Tab(
                icon: Icon(Icons.photo_library_outlined),
              ),
            ],
            indicatorColor: Colors.transparent,
            labelColor: const Color.fromARGB(255, 30, 215, 96),
            unselectedLabelColor: Color.fromARGB(255, 70, 85, 100),
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            SearchScreen(),
            ComingSoonScreen(),
          ],
        ),
      ),
    );
  }
}
