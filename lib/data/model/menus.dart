import 'menu.dart';

class Menus {
  List<Menu> foods;
  List<Menu> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Menu>.from(json['foods'].map((x) => Menu.fromJson(x))),
        drinks: List<Menu>.from(json['drinks'].map((x) => Menu.fromJson(x))),
      );
}
