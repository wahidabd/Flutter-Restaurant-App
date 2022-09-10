import 'dart:convert';

class Restaurant {
  final List<RestaurantOfObject> restaurants;

  Restaurant({
    required this.restaurants,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurants) => Restaurant(
      restaurants: List<RestaurantOfObject>.from(restaurants['restaurants']
          .map((json) => RestaurantOfObject.fromJson(json))));

  Map<String, dynamic> toJson() => {
    "restaurants": List<dynamic>.from(restaurants.map((json) => json.toJson())),
  };
}

class RestaurantOfObject {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  RestaurantOfObject({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory RestaurantOfObject.fromJson(Map<String, dynamic> restaurant) =>
      RestaurantOfObject(
          id: restaurant['id'],
          name: restaurant['name'],
          description: restaurant['description'],
          pictureId: restaurant['pictureId'],
          city: restaurant['city'],
          rating: restaurant['rating'].toDouble(),
          menus: Menus.fromJson(restaurant['menus']));

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
    "menus": menus.toJson(),
  };
}

class Menus {
  final List<MenuName> foods;
  final List<MenuName> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> menus) => Menus(
      foods: List<MenuName>.from(
          menus['foods'].map((json) => MenuName.fromJson(json))),
      drinks: List<MenuName>.from(
          menus['drinks'].map((json) => MenuName.fromJson(json))));

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((json) => json.toJson())),
        "drinks": List<dynamic>.from(drinks.map((json) => json.toJson()))
      };
}

class MenuName {
  final String name;

  MenuName({
    required this.name,
  });

  factory MenuName.fromJson(Map<String, dynamic> menuName) =>
      MenuName(name: menuName['name']);

  Map<String, dynamic> toJson() => {"name": name};
}


List<RestaurantOfObject> parseList(String? json) {
  if(json == null){
    return [];
  }

  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => RestaurantOfObject.fromJson(json)).toList();
}

RestaurantFromJson(String str) => Restaurant.fromJson(json.decode(str));
String restaurantToJson(Restaurant data) => json.encode(data.toJson());