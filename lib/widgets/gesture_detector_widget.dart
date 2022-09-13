import 'package:flutter/material.dart';
import 'package:my_restaurant/ui/restaurant_detail_page.dart';
import 'package:my_restaurant/utils/styles.dart';

import '../data/model/restaurant.dart';

Widget gestureDetectorWidget(BuildContext context, Restaurant restaurant) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        RestaurantDetail.routeName,
        arguments: restaurant,
      );
    },
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: primaryColor),
          margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
          child: Row(
            children: [
              Hero(
                tag: restaurant.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    restaurant.getMediumImage(),
                    width: 130,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.white, size: 20.0),
                          const SizedBox(width: 4),
                          Text(
                            restaurant.city,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.yellow, size: 20.0),
                          const SizedBox(width: 4),
                          Text(
                            restaurant.rating.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
