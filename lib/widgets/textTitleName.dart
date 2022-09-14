import 'package:flutter/cupertino.dart';
import '../utils/styles.dart';

Widget textName(BuildContext context, String title) {
  return Container(
    margin: const EdgeInsets.only(left: 20),
    child: Column(
      children: [
        const SizedBox(height: 14),
        Text(
          title,
          style: const TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    ),
  );
}