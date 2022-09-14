import 'package:my_restaurant/data/model/restaurant.dart';

class ResponseRestaurant{
  bool error;
  String message;
  Restaurant restaurant;

  ResponseRestaurant({
    required this.error,
    required this.message,
    required this.restaurant
  });

  factory ResponseRestaurant.fromJson(Map<String, dynamic> json) => ResponseRestaurant(
    error: json['error'],
    message: json['message'],
    restaurant: Restaurant.fromJson(json['restaurant'])
  );

}