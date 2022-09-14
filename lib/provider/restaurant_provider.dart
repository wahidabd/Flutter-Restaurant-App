import 'package:flutter/cupertino.dart';
import 'package:my_restaurant/data/api/api_service.dart';
import 'package:my_restaurant/data/response/response_restaurant.dart';
import 'package:my_restaurant/data/response/response_restaurant_list.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService api;

  late ResultState _state;
  String _message = '';
  ResultState get state => _state;
  String get message => _message;

  RestaurantProvider({required this.api, String? id}){
    if(id == null){
      _fetchList();
    }else {
      _fetchDetail(id);
    }
  }

  late ResponseRestaurantList _restaurants;
  ResponseRestaurantList get restaurants => _restaurants;
  Future<dynamic> _fetchList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final response = await api.getList();

      if (response.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurants = response;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "$e";
    }
  }

  late ResponseRestaurant _restaurant;
  ResponseRestaurant get restaurant => _restaurant;
  Future<dynamic> _fetchDetail(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final response = await api.getDetail(id);

      if (response.error){
        _state = ResultState.error;
        notifyListeners();
        return _message = response.message;
      }else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurant = response;
      }
    }catch(e){
      _state = ResultState.error;
      notifyListeners();
      return _message = "$e";
    }
  }
}
