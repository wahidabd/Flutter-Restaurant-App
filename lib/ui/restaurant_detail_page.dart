import 'package:flutter/material.dart';
import 'package:my_restaurant/data/api/api_service.dart';
import 'package:my_restaurant/data/model/menus.dart';
import 'package:my_restaurant/provider/restaurant_provider.dart';
import 'package:my_restaurant/widgets/bottom_content_widget.dart';
import 'package:my_restaurant/widgets/category_widget.dart';
import 'package:my_restaurant/widgets/stack_widget.dart';
import 'package:my_restaurant/widgets/text_title_name.dart';
import 'package:provider/provider.dart';

class RestaurantDetail extends StatefulWidget {
  static const routeName = '/restaurant_detail';
  final String restaurantId;

  const RestaurantDetail({Key? key, required this.restaurantId})
      : super(key: key);

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {

  bool expandFoods = false;
  bool expandDrinks = false;

  Widget _menuList(Menus menus){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionPanelList(
          expandedHeaderPadding: const EdgeInsets.symmetric(horizontal: 12),
          elevation: 0,
          expansionCallback: (int index, bool status){
            setState(() {
              if(index == 0){
                expandFoods = !status;
              }else{
                expandDrinks = !status;
              }
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool status){
                return const ListTile(
                  title: Text('Foods'),
                );
              },
              body: menus.drinks.isNotEmpty
                ? Column(
                children: menus.foods.map((data) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ListTile(
                    title: Text(
                      data.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                )).toList(),
              ) : const Text(
                'No Data'
              ),
              isExpanded: expandFoods,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool status){
                return const ListTile(
                  title: Text('Drinks'),
                );
              },
              body: menus.foods.isNotEmpty
                  ? Column(
                children: menus.foods.map((data) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListTile(
                    title: Text(
                      data.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                )).toList(),
              ) : const Text(
                  'No Data'
              ),
              isExpanded: expandDrinks,
            ),
          ],
        ),
      ],
    );
  }

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
                _menuList(restaurant.menus!)
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
        create: (_) => RestaurantProvider(id: widget.restaurantId),
        child: _buildPage(),
    ));
  }
}
