import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/size.dart';
import '../widgets/build_drawer.dart';
import '../widgets/title_appBar.dart';

class CartItem {
  final String name;
  final String image;
  final String status;
  final String unit;
  int quantity;
  final double price;

  CartItem({
    required this.name,
    required this.image,
    required this.status,
    required this.unit,
    required this.quantity,
    required this.price,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}
class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      name: 'Rice Seeds',
      image: '🌾',
      status: 'Available in stock',
      unit: '5kg',
      quantity: 1,
      price: 25.99,
    ),
    CartItem(
      name: 'Lime Seedlings',
      image: '🌱',
      status: 'Available in stock',
      unit: '10g',
      quantity: 1,
      price: 12.50,
    ),
    CartItem(
      name: 'Pumpkin Seeds',
      image: '🎃',
      status: 'Available in stock',
      unit: '2kg',
      quantity: 1,
      price: 18.75,
    ),
    CartItem(
      name: 'Tractor',
      image: '🚜',
      status: 'Available in stock',
      unit: '2 days',
      quantity: 1,
      price: 250.00,
    ),
  ];

  void _updateQuantity(int index, bool increase) {
    setState(() {
      if (increase) {
        cartItems[index].quantity++;
      } else if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      }
    });
  }

  void _deleteItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  double get totalAmount {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BuildDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
        title: TAppBar(
            title: 'Cart'
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.sort, size: TSizes.iconLg),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              focusColor: Colors.grey,
              autofocus: true,
              disabledColor: Colors.grey,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(cartItems[index].name),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _deleteItem(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${cartItems[index].name} removed from cart'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Checkmark
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        SizedBox(width: 12),

                        // Product Image
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              cartItems[index].image,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),

                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItems[index].name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                cartItems[index].status,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                cartItems[index].unit,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Quantity Controls
                        Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () => _updateQuantity(index, false),
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  '${cartItems[index].quantity}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 12),
                                GestureDetector(
                                  onTap: () => _updateQuantity(index, true),
                                  child: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Checkout Button
          Container(
            padding: EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Center(child: Row(
                        children: [
                          Text('Proceeding to checkout - Total : ', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: TSizes.md,
                          ),),
                          Text('\$ ${totalAmount.toStringAsFixed(2)}', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: TSizes.lg,
                          ),),
                        ],
                      )),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}