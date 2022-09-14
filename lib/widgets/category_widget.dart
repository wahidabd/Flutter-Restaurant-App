import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_restaurant/data/model/categories.dart';
import 'package:my_restaurant/data/model/restaurant.dart';
import 'package:my_restaurant/utils/styles.dart';

Widget categoryWidget(BuildContext context, Restaurant restaurant) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.05,
    width: MediaQuery.of(context).size.width * 0.95,
    child: ListView(
      padding: EdgeInsets.only(left: 20),
      scrollDirection: Axis.horizontal,
      children: restaurant.categories!.map((data){
        return Container(
          margin: EdgeInsets.only(right: 6),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: primaryColor),
          ),
          child: Text(
            data.name,
            style: TextStyle(color: primaryColor),
            textAlign: TextAlign.justify,
          ),
        );
      }).toList(),
    ),
  );
}