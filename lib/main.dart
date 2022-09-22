import 'package:flutter/material.dart';
import 'package:my_restaurant/data/model/restaurant.dart';
import 'package:my_restaurant/data/model/review.dart';
import 'package:my_restaurant/ui/restaurant_detail_page.dart';
import 'package:my_restaurant/ui/restaurant_list_page.dart';
import 'package:my_restaurant/ui/restaurant_review_page.dart';
import 'package:my_restaurant/ui/search_page.dart';
import 'package:my_restaurant/ui/splash_page.dart';

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
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => const SplashPage(),
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        RestaurantDetail.routeName: (context) => RestaurantDetail(
          restaurantId: ModalRoute.of(context)?.settings.arguments as dynamic,
        ),
        RestaurantReviewPage.routeName: (context) => RestaurantReviewPage(
          reviews: ModalRoute.of(context)?.settings.arguments as List<Review>,
        ),
        SearchPage.routeName: (context) => const SearchPage()
      },
    );
  }
}
