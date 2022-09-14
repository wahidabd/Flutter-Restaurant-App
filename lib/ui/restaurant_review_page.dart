import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_restaurant/data/model/review.dart';
import 'package:my_restaurant/utils/styles.dart';

class RestaurantReviewPage extends StatelessWidget {

  static const routeName = '/restaurant_review';
  final List<Review> reviews;
  const RestaurantReviewPage({Key? key, required this.reviews}) : super(key: key);

  Widget _items(Review review){
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              child: Text(
                review.name[0],
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      review.date,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      review.review,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Reviews',
          style: TextStyle(color: primaryColor),
        ),
        iconTheme: const IconThemeData(
          color: primaryColor
        ),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index){
          Review review = reviews[index];
          return _items(review);
        },
      ),
    );
  }
}
