import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:my_restaurant/data/api/api_service.dart';
import 'package:my_restaurant/data/response/response_restaurant.dart';
import 'package:my_restaurant/data/response/response_restaurant_list.dart';
import 'dart:developer' as dev;

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService api = ApiService();

  late ResultState _state;
  String _message = '';

  ResultState get state => _state;

  String get message => _message;

  RestaurantProvider({String? id, String? q}) {
    if (id != null) {
      _fetchDetail(id);
    } else {
      _fetchList();
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
    } on SocketException catch(_){
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No connection!';
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

      if (response.error) {
        _state = ResultState.error;
        notifyListeners();
        return _message = response.message;
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurant = response;
      }
    } on SocketException catch(_){
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No connection!';
    }catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "$e";
    }
  }

  String _query = '';

  String get query => _query;

  RestaurantProvider onSearch(String q) {
    _fetchSearch(q);
    return this;
  }

  Future<dynamic> _fetchSearch(String q) async {
    try {
      _state = ResultState.loading;
      _query = q;
      notifyListeners();

      if (q.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        _message = 'Empty Data';
      }

      final response = await api.getSearch(q);

      if (response.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        dev.log("$response");
        return _restaurants = response;
      }
    } on SocketException catch(_){
      _state = ResultState.error;
      notifyListeners();
      return _message = 'No connection!';
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      dev.log("$e");
      return _message = "$e";
    }
  }
}
