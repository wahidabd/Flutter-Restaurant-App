import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_restaurant/data/response/response_restaurant.dart';
import 'package:my_restaurant/data/response/response_restaurant_list.dart';
import 'package:my_restaurant/utils/constants.dart';
import '../model/restaurant.dart';

class ApiService {

  Future<ResponseRestaurantList> getList() async {
    final response = await http.get(Uri.parse("${Constants.BASE_URL}list"));
    if(response.statusCode == 200){
      return ResponseRestaurantList.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load API!');
    }
  }

  Future<ResponseRestaurant> getDetail(String id) async {
    final response = await http.get(Uri.parse("${Constants.BASE_URL}detail/$id"));
    if (response.statusCode == 200){
      return ResponseRestaurant.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load API!');
    }
  }

}