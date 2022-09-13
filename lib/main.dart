import 'package:flutter/material.dart';
import 'package:my_restaurant/data/model/restaurant.dart';
import 'package:my_restaurant/ui/restaurant_detail_page.dart';
import 'package:my_restaurant/ui/restaurant_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant',
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        RestaurantDetail.routeName: (context) => RestaurantDetail(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        )
      },
    );
  }
}
