import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_restaurant/ui/restaurant_list_page.dart';

class SplashPage extends StatelessWidget {


  static const routeName = 'splash';
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var duration = const Duration(seconds: 2);
    Timer(duration, () {
      Navigator.pushReplacementNamed(context, RestaurantListPage.routeName);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          'https://us.123rf.com/450wm/benidict83/benidict832008/benidict83200800014/153588168-plate-with-fork-and-spoon-restaurant-logo.jpg',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
