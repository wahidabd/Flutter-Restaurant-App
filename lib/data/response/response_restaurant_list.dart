import '../model/restaurant.dart';

class ResponseRestaurantList {
  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  ResponseRestaurantList(
      {required this.error,
      required this.message,
      required this.count,
      required this.restaurants});

  factory ResponseRestaurantList.fromJson(Map<String, dynamic> json) =>
      ResponseRestaurantList(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        restaurants: List<Restaurant>.from(
            json['restaurants'].map((x) => Restaurant.fromJson(x))),
      );
}
