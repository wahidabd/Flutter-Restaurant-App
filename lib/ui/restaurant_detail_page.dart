import 'package:flutter/material.dart';
import 'package:my_restaurant/data/api/api_service.dart';
import 'package:my_restaurant/provider/restaurant_provider.dart';
import 'package:my_restaurant/utils/styles.dart';
import 'package:my_restaurant/widgets/bottom_content_widget.dart';
import 'package:my_restaurant/widgets/category_widget.dart';
import 'package:my_restaurant/widgets/stack_widget.dart';
import 'package:my_restaurant/widgets/textTitleName.dart';
import 'package:provider/provider.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final String restaurantId;

  const RestaurantDetail({Key? key, required this.restaurantId})
      : super(key: key);

  Widget _buildPage() {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          var restaurant = state.restaurant.restaurant;
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                stackWidget(context, restaurant),
                textName(context, 'Categories'),
                const SizedBox(height: 10),
                categoryWidget(context, restaurant),
                bottomContentWidget(context, restaurant),
              ],
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(api: ApiService(), id: restaurantId),
      child: _buildPage(),
    ));
  }
}
