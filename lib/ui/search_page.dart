import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_restaurant/data/api/api_service.dart';
import 'package:my_restaurant/provider/restaurant_provider.dart';
import 'package:my_restaurant/utils/styles.dart';
import 'package:my_restaurant/widgets/gesture_detector_widget.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;

class SearchPage extends StatefulWidget {

  static const routeName = '/search';
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String query = '';

  Widget _buildList(){
    return Consumer<RestaurantProvider>(
      builder: (context, state, _){
        if(state.state == ResultState.loading){
          return const Center(child: CircularProgressIndicator());
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
          return const Center(
            child: Material(
              child: Text('No Data'),
            ),
          );
        }else {
          return const Center(
            child: Material(
              child: Text('UNKNOWN ERROR'),
            ),
          );
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: Consumer<RestaurantProvider>(
                builder: (context, state, _){
                  return TextField(
                    onChanged: (value) {
                      if(value.isNotEmpty){
                        setState(() {
                          state.onSearch(value);
                        });
                      }
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: primaryColor,),
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        body: _buildList(),
      ),
    );
  }
}
