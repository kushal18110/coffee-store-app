import 'package:coffee_2/components/coffeeList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/homepage.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => coffeeShop(), builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),);
  }
}