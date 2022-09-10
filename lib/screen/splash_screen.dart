import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app/page/restaurant_list_page.dart';

class SplashScreen extends StatefulWidget {

  static const routeName = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startSplash();
  }

  startSplash() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return const RestaurantListPage();
        })
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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