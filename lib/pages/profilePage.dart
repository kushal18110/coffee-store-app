import 'package:flutter/material.dart';

import 'newPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    void nextPage(){
      Navigator.push(context , MaterialPageRoute(builder: (context){
        return NewPage();
      }));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: nextPage
          ,child: Text('next')),

      ),
    );
  }
}
