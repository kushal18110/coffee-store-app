import 'package:coffee_2/components/coffeeList.dart';
import 'package:coffee_2/components/coffeeModel.dart';
import 'package:coffee_2/components/coffeeTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'profilePage.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //remove from cart function
  void removeFromCart(Coffee coffee) {
    Provider.of<coffeeShop>(context, listen: false).removeFromCart(coffee);
  }

  //navigate page
  void nextPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfilePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<coffeeShop>(builder: (context, value, child) {
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Your cart',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      //get user cart
                      Coffee eachCoffee = value.userCart[index];

                      return CoffeeTile(
                        coffee: eachCoffee,
                        onTap: () => removeFromCart(eachCoffee),
                        icon: Icon(Icons.delete),
                        borderRadius: BorderRadius.circular(4),
                      );
                    })),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.brown[200],
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total price:',
                        style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$' + value.calculateTotal(),
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: nextPage,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.brown[700],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Pay now',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
