import 'package:flutter/material.dart';
import 'package:restaurant_app/data/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final RestaurantOfObject restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 80.0,
        ),
        const Icon(
          Icons.location_city_rounded,
          color: Colors.white,
          size: 40.0,
        ),
        const SizedBox(
          width: 90.0,
          child: Divider(
            color: Colors.green,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          restaurant.name,
          style: const TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    color: Colors.white,
                  ),
                  Text(
                    restaurant.city,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      restaurant.rating.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );

    final topContent = Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(restaurant.pictureId),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 20.0,
          top: 40.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

    final bottomContentText = Text(
      restaurant.description,
      style: const TextStyle(
        fontSize: 18.0,
      ),
      textAlign: TextAlign.justify,
    );

    final foodsMenu = SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.95,
      child: ListView(
        padding: const EdgeInsets.only(left: 20.0),
        scrollDirection: Axis.horizontal,
        children: restaurant.menus.foods.map((data) {
          return Container(
            margin: const EdgeInsets.only(right: 6.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: const Color.fromRGBO(58, 66, 86, 1.0)),
            ),
            child: Text(
              data.name,
              style: const TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0)),
              textAlign: TextAlign.justify,
            ),
          );
        }).toList(),
      ),
    );

    final drinksMenu = SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.95,
      child: ListView(
        padding: const EdgeInsets.only(left: 20.0),
        scrollDirection: Axis.horizontal,
        children: restaurant.menus.drinks.map((data) {
          return Container(
            margin: const EdgeInsets.only(right: 6.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: const Color.fromRGBO(58, 66, 86, 1.0)),
            ),
            child: Text(
              data.name,
              style: const TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0)),
              textAlign: TextAlign.justify,
            ),
          );
        }).toList(),
      ),
    );

    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding:
          const EdgeInsets.only(top: 12.0, left: 20, right: 20, bottom: 40.0),
      child: Center(
        child: Column(
          children: [bottomContentText],
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topContent,
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: const Text(
                'Foods',
                style: TextStyle(
                  color: Color.fromRGBO(58, 66, 86, 1.0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 12.0),
            foodsMenu,
            const SizedBox(height: 12.0),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: const Text(
                'Drinks',
                style: TextStyle(
                  color: Color.fromRGBO(58, 66, 86, 1.0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 12.0),
            drinksMenu,
            bottomContent
          ],
        ),
      ),
    );
  }
}
