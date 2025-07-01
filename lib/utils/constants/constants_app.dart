import 'package:e_commerce_app/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

var myAppBar = AppBar(
  title: const Text(
    TTexts.appName,
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      wordSpacing: 1.5,
    ),
  ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.search,

        size: 30,
        semanticLabel: "search",
      ),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.shopping_cart_outlined,
        size: 30,
        semanticLabel: "search",
      ),
    ),
    const SizedBox(
      width: 10,
    ),
  ],
);

var myDefaultBackgroundColor = Colors.grey[300];

var myDrawer = Drawer(
  shape: const BeveledRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(10),
      bottomRight: Radius.circular(10),
    ),
  ),
  backgroundColor: Colors.grey[200],
  elevation: 0,
  child: Column(
    children: [
      const UserAccountsDrawerHeader(
        accountName: Text("Sunheng BroKH"),
        accountEmail: Text("sunheng270405@gmail.com"),
      ),
      ListTile(
        leading: Icon(Icons.dashboard),
        title: Text("Dashboard"),
        onTap: () {
          debugPrint('sun');
        },
      ),
    ],
  ),
);
