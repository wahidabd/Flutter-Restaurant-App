import 'package:flutter/material.dart';
import 'package:my_restaurant/data/model/restaurant.dart';
import 'package:my_restaurant/ui/restaurant_review_page.dart';
import 'package:my_restaurant/utils/styles.dart';

Widget stackWidget(BuildContext context, Restaurant restaurant) {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 10.0),
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(restaurant.getMediumImage()),
                fit: BoxFit.cover)),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(40.0),
        decoration: const BoxDecoration(color: primaryColorOpacity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const Icon(
              Icons.location_city_outlined,
              color: Colors.white,
              size: 40.0,
            ),
            const SizedBox(
              width: 90,
              child: Divider(color: Colors.grey),
            ),
            Text(
              restaurant.name,
              style: const TextStyle(color: Colors.white, fontSize: 46.0),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        restaurant.city,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 50),
                      const Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        restaurant.rating.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        left: 20.0,
        top: 40.0,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      Positioned(
        right: 20.0,
        top: 40.0,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              RestaurantReviewPage.routeName,
              arguments: restaurant.review,
            );
          },
          child: const Icon(
            Icons.chat_bubble_outline_outlined,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
