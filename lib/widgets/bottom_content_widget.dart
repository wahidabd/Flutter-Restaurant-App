import 'package:flutter/cupertino.dart';
import 'package:my_restaurant/data/model/menus.dart';
import 'package:my_restaurant/data/model/restaurant.dart';

Widget bottomContentWidget(BuildContext context, Restaurant restaurant){
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 40),
    child: Center(
      child: Column(
        children: [
          Text(
            restaurant.description,
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    ),
  );
}