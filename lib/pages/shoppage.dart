import 'package:coffee_2/components/coffeeList.dart';
import 'package:coffee_2/components/coffeeTile.dart';
import 'package:coffee_2/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/coffeeModel.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add to cart
  void addToCart(Coffee coffee) {
    Provider.of<coffeeShop>(context, listen: false).addToCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<coffeeShop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: backgroundColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, right: 15, left: 15),
                      child: Text(
                        'Which Coffee would you like?',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.coffeeList.length,
                        itemBuilder: (context, index) {
                          //get each coffee
                          Coffee eachCoffee = value.coffeeList[index];
                          return CoffeeTile(
                            coffee: eachCoffee,
                            onTap: () => addToCart(eachCoffee),
                            icon: Icon(Icons.add),
                            borderRadius: BorderRadius.circular(20),
                          );
                        }),
                  ),
                ],
              ),
            ));
  }
}
