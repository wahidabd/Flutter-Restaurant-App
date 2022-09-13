import 'package:my_restaurant/data/model/restaurant.dart';

class ResponseRestaurant{
  bool error;
  String message;
  int count;
  Restaurant restaurant;

  ResponseRestaurant({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurant
  });

  factory ResponseRestaurant.fromJson(Map<String, dynamic> json) => ResponseRestaurant(
    error: json['error'],
    message: json['message'],
    count: json['count'],
    restaurant: Restaurant.fromJson(json['restaurant'])
  );

}