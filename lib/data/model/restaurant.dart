import 'package:my_restaurant/data/model/categories.dart';
import 'package:my_restaurant/data/model/menus.dart';
import 'package:my_restaurant/data/model/review.dart';
import 'package:my_restaurant/utils/constants.dart';

class Restaurant {
  String id;
  String name;
  String description;
  String city;
  String? address;
  String pictureId;
  double rating;
  List<Categories>? categories;
  // Menus? menus;
  // List<Review>? review;

  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.city,
      required this.address,
      required this.pictureId,
      required this.rating,
      required this.categories
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      address: json['address'],
      pictureId: json['pictureId'],
      rating: json['rating'].toDouble(),
      categories: json['categories'] == null
          ? null
          : List<Categories>.from(
              json['categories'].map((x) => Categories.fromJson(x))));

      // menus: json['menus'] == null
      //     ? null
      //     : Menus.fromJson(json['menus'].map((x) => Menus.fromJson(x))),

      // review: json['customerReviews'] == null
      //     ? null
      //     : List<Review>.from(
      //         json['customerReviews'].map((x) => Review.fromJson(x))));

  String getSmallImage() => Constants.IMAGE_SML + pictureId;

  String getMediumImage() => Constants.IMAGE_MED + pictureId;

  String getLargeImage() => Constants.IMAGE_LRG + pictureId;
}
