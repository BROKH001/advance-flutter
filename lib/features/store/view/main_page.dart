import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'pages/account_page.dart';
import 'pages/cart_page.dart';
import 'pages/home_store.dart';
import 'pages/service_page.dart';
import 'widgets/build_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BuildDrawer(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: const [
        HomeStore(),
        ServicePage(),
        CartPage(),
        AccountPage(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Iconsax.home),
            label: 'Home',
            activeIcon: Icon(
              Iconsax.home_15,
              color: Colors.green[700],
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Iconsax.shop),
            label: 'Service',
            activeIcon: Icon(
              Iconsax.shop5,
              color: Colors.green[700],
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Iconsax.shopping_cart),
            label: 'Cart',
            activeIcon: Icon(
              Iconsax.shopping_cart5,
              color: Colors.green[700],
            ),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Iconsax.profile_circle4),
            label: 'Account',
            activeIcon: Icon(
              Iconsax.profile_circle5,
              color: Colors.green[700],
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          color: Colors.green[700],
          size: 30,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[500],
          size: 25,
        ),
        elevation: 0,
        // showSelectedLabels: true,
        // showUnselectedLabels: true,
        iconSize: 25,
        unselectedFontSize: 14,
        selectedFontSize: 18,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green[700],
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey[600],
        ),
        selectedItemColor: Colors.green[700],
        enableFeedback: true,
        backgroundColor: Colors.white,
    );
  }
}
