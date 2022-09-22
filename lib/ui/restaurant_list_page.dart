import 'package:flutter/material.dart';
import 'package:my_restaurant/provider/restaurant_provider.dart';
import 'package:my_restaurant/ui/search_page.dart';
import 'package:my_restaurant/utils/styles.dart';
import 'package:my_restaurant/widgets/gesture_detector_widget.dart';
import 'package:provider/provider.dart';

class RestaurantListPage extends StatelessWidget {

  static const routeName = 'list_page';

  const RestaurantListPage({Key? key}) : super(key: key);

  Widget _buildList() {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _ ) {
        if (state.state == ResultState.loading){
          return const Center(child: CircularProgressIndicator(),);
        }else if (state.state == ResultState.hasData){
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.restaurants.restaurants.length,
            itemBuilder: (context, index){
              var restaurant = state.restaurants.restaurants[index];
              return gestureDetectorWidget(context, restaurant);
            },
          );
        }else if (state.state == ResultState.noData){
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else if(state.state == ResultState.error){
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
      appBar: AppBar(
        title: const Text(
          'Restaurant',
          style: TextStyle(color: primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              SearchPage.routeName
            ),
            icon: const Icon(Icons.search),
            color: primaryColor,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.1,
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<RestaurantProvider>(
        create: (_) => RestaurantProvider(),
        child: _buildList(),
      ),
    );
  }
}
