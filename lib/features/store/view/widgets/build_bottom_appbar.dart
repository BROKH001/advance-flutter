// import 'package:flutter/material.dart';
// import 'package:homework/features/store/view/home_store.dart';
// import 'package:homework/features/store/view/service_page.dart';

// import '../account_page.dart';
// import '../cart_page.dart';

// class BuildBottomAppBar extends StatefulWidget {
//   const BuildBottomAppBar({super.key});

//   @override
//   State<BuildBottomAppBar> createState() => _BuildBottomAppBarState();
// }

// class _BuildBottomAppBarState extends State<BuildBottomAppBar> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(),
//       bottomNavigationBar: _buildBottomNavigationBar(),
//     );
//   }

//   Widget _buildBody() {
//     return IndexedStack(
//       index: _currentIndex,
//       children: const [
//         HomeStore(),
//         GroceryPage(),
//         SearchPage(),
//         AccountPage(),
//       ],
//     );
//   }

//   Widget _buildBottomNavigationBar() {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       onTap: (index) {
//         setState(() {
//           _currentIndex = index;
//         });
//       },
//       items: [
//         BottomNavigationBarItem(
//           icon: const Icon(Icons.home),
//           label: 'Food',
//           activeIcon: Icon(
//             Icons.home_outlined,
//             color: Colors.green[700],
//           ),
//         ),
//         BottomNavigationBarItem(
//           icon: const Icon(Icons.store),
//           label: 'Grocery',
//           activeIcon: Icon(
//             Icons.store_outlined,
//             color: Colors.green[700],
//           ),
//         ),
//         BottomNavigationBarItem(
//           icon: const Icon(Icons.search),
//           label: 'Search',
//           activeIcon: Icon(
//             Icons.search_outlined,
//             color: Colors.green[700],
//           ),
//         ),
//         BottomNavigationBarItem(
//           icon: const Icon(Icons.person),
//           label: 'Account',
//           activeIcon: Icon(
//             Icons.person_outline,
//             color: Colors.green[700],
//           ),
//         ),
//       ],
//       type: BottomNavigationBarType.fixed,
//       selectedIconTheme: IconThemeData(
//         color: Colors.green[700],
//         size: 30,
//       ),
//       unselectedIconTheme: IconThemeData(
//         color: Colors.grey[500],
//         size: 25,
//       ),
//       elevation: 0,
//       showSelectedLabels: true,
//       showUnselectedLabels: true,
//       iconSize: 25,
//       unselectedFontSize: 14,
//       selectedFontSize: 18,
//       selectedLabelStyle: TextStyle(
//         fontWeight: FontWeight.bold,
//         color: Colors.green[700],
//       ),
//       unselectedLabelStyle: TextStyle(
//         fontWeight: FontWeight.w600,
//         color: Colors.grey[600],
//       ),
//       selectedItemColor: Colors.green[700],
//       enableFeedback: true,
//       backgroundColor: Colors.white,
//     );
//   }
// }
