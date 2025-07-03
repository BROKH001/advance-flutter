

import 'package:e_commerce_app/features/store/view/main_page.dart';
import 'package:e_commerce_app/features/store/view/pages/home_store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Detail"),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                // GetX

                // Navigator
                Navigator.pop(context);
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            icon: Icon(
              _isSelected ? Iconsax.bookmark : Iconsax.bookmark,
              color: _isSelected ? Colors.green : Colors.yellowAccent,
              size: 30,
            ),
          ),
          SizedBox(width: 15,),
        ],
      ),
    );
  }
}
