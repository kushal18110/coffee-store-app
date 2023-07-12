import 'package:coffee_2/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'cartpage.dart';
import 'shoppage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //pages change
  bool _changePages = true;

  //page change function
  void pageChange() {
    setState(() {
      _changePages = !_changePages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: _changePages ? ShopPage() : CartPage(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GNav(
              duration: Duration(milliseconds: 200),
              tabBorder: Border.all(color: Colors.brown.shade200),
              activeColor: Colors.brown.shade100,
              tabBackgroundColor: Colors.brown.shade700,
              padding: EdgeInsets.all(10),
              tabs: [
                GButton(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(20),
                  borderRadius: _changePages
                      ? BorderRadius.circular(12)
                      : BorderRadius.circular(30),
                  onPressed: pageChange,
                  icon: (Icons.shopping_bag_outlined),
                  text: 'Shop',
                ),
                GButton(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(20),
                  borderRadius: _changePages
                      ? BorderRadius.circular(30)
                      : BorderRadius.circular(12),
                  onPressed: pageChange,
                  icon: Icons.shopping_cart_checkout,
                  text: 'cart',
                )
              ]),
        ],
      ),
    );
  }
}
