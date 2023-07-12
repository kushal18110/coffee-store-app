import 'package:coffee_2/components/coffeeModel.dart';
import 'package:coffee_2/components/coffeeTile.dart';
import 'package:flutter/material.dart';

class coffeeShop  extends ChangeNotifier{
  final List<Coffee> coffeeList = [
    Coffee(
        name: 'black coffee',
        price: '3.40',
        imagePath: 'lib/images/black-coffee.png'),
    Coffee(
        name: 'Expresso', price: '4.20', imagePath: 'lib/images/expresso.png'),
    Coffee(
        name: 'ice coffee',
        price: '2.70',
        imagePath: 'lib/images/ice-coffee.png'),
    Coffee(name: 'latte', price: '4.40', imagePath: 'lib/images/latte.png'),
  ];

  //user cart 
  List<Coffee> _userCart = [];

  //make this list avalable everywhere
  List<Coffee> get coffeelist => coffeeList;


  //get user cart
  List<Coffee> get userCart => _userCart;





  //add item to user cart
  void addToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
    
  }


  //remove item from cart
  void removeFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }


  //total price
  String calculateTotal(){
    double totalPrice = 0.0;
    for(int i = 0; i< userCart.length; i++ ){
      totalPrice += double.parse(userCart[i].price);

    }

    return totalPrice.toStringAsFixed(2);
  }
}
