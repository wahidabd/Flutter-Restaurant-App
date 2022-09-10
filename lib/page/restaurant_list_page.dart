import 'package:flutter/material.dart';
import 'package:restaurant_app/data/restaurant.dart';
import 'package:restaurant_app/page/restaurant_detail_page.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text(
          'Restaurant',
          style: TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0)),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              final List<RestaurantOfObject> restaurants =
                  parseList(snapshot.data);
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return _buildRestaurant(context, restaurants[index]);
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildRestaurant(BuildContext context, RestaurantOfObject restaurant) {
    return Card(
      elevation: 0.8,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: Colors.white24),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                width: 70,
                height: 60,
                image: NetworkImage(restaurant.pictureId),
              ),
            ),
          ),
          title: Text(
            restaurant.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.white,
              ),
              Text(
                restaurant.city,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              RestaurantDetailPage.routeName,
              arguments: restaurant,
            );
          },
        ),
      ),
    );
  }
}
