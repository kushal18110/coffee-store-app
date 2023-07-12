import 'package:coffee_2/components/coffeeList.dart';
import 'package:coffee_2/components/coffeeModel.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  CoffeeTile({super.key, required this.coffee, required this.onTap, required this.icon, required this.borderRadius});

  final Coffee coffee;
  final void Function()? onTap;
  final Widget icon;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown[100], borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.all(7),
                  height: 60,
                  width: 60,
                  child: Image.asset(coffee.imagePath)),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffee.name,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    coffee.price,
                    style: TextStyle(color: Colors.grey.shade600),
                  )
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.brown[200],
                  borderRadius: borderRadius),
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}
