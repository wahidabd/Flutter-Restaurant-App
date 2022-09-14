import 'package:flutter/cupertino.dart';
import 'package:my_restaurant/data/model/menus.dart';
import 'package:my_restaurant/data/model/restaurant.dart';
import 'package:my_restaurant/widgets/text_title_name.dart';

Widget bottomContentWidget(BuildContext context, Restaurant restaurant){
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
    child: Column(
      children: [
        Text(
          restaurant.description,
          style: const TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    ),
  );
}