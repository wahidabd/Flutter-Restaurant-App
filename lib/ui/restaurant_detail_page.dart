import 'package:flutter/cupertino.dart';
import 'package:my_restaurant/data/model/restaurant.dart';

class RestaurantDetail extends StatelessWidget {

  static const routeName = '/restaurant_detail';
  final Restaurant restaurant;
  const RestaurantDetail({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
