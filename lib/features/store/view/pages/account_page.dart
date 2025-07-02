import 'package:e_commerce_app/features/store/view/widgets/build_drawer.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/size.dart';
import '../widgets/title_appBar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.only(left: 15, right: 15),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InfoCard(label: "Favorite", value: "230"),
                                InfoCard(label: "Favorite", value: "230"),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            height: 130,
                            width: 130,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.cyan.shade200,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/others/user.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Sun Heng BroKH",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.red,),
                    Text(
                      'Kandal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: MenuList(),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: TAppBar(
        title: 'Profile',
      ),
      centerTitle: true,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.sort, size: TSizes.iconLg),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations
                .of(context)
                .openAppDrawerTooltip,
            focusColor: Colors.grey,
            autofocus: true,
            disabledColor: Colors.grey,
          );
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.edit,
            size: TSizes.iconLg,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String value;

  const InfoCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {"icon": Icons.location_on, "text": "Shipping Address"},
      {"icon": Icons.payment, "text": "Payment Settings"},
      {"icon": Icons.history, "text": "Order History"},
      {"icon": Icons.settings, "text": "Settings"},
      {"icon": Icons.policy, "text": "Privacy Policy"},
      {"icon": Icons.logout, "text": "Logout"},
    ];

    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return Container(
          height: 70,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Icon(menuItems[index]["icon"], color: Colors.green, size: 30,),
            title: Text(menuItems[index]["text"], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            splashColor: Colors.green.shade200.withOpacity(0.5),
            onTap: () {
              // Get.to another page ......
            },
          ),
        );
      },
    );
  }
}