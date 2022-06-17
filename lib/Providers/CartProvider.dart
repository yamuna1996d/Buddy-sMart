

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Helpers/PrefsHelper.dart';
import '../Models/CartModel.dart';

class CartProvider extends ChangeNotifier{
  List<CartModel> _cart = [];
  List<CartModel> get items{
    return _cart;
  }
  int get cartCount{
    return _cart.length;
  }

  double get total{
    double total = 0;
    for(int i=0;i<_cart.length;i++){
      total += (double.parse(_cart[i].price) * double.parse(_cart[i].quantity));
    }
    return total;
  }
  double get finaltotal{
    double finaltotals = 0;
    finaltotals += total;
    return finaltotals;
  }

  void addToCart(CartModel item){
    if(_cart.length == 0 ){
      _cart.add(item);
    }else{
      if(item.quantity == "0"){
        deleteItem(item.sid);
      }else{
        addItem(item);
      }
    }
    notifyListeners();
    PrefsHelper.saveCart(jsonEncode(_cart));
  }

  void deleteItem(String sId) {
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].sid == sId){
        _cart.removeAt(i);
      }
    }
    PrefsHelper.saveCart(jsonEncode(_cart));
  }

  void addItem(CartModel item) {
    bool found = false;
    int index = 0;
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].sid == item.sid){
        found = true;
        index = i;
      }
    }
    if(found){
      _cart[index].quantity = item.quantity;
    }else{
      _cart.add(item);
    }
  }
  Object quantity (String id){

    for(int i=0;i<_cart.length;i++){
      if(_cart[i].sid==id){
        return _cart[i].quantity;
      }
    }
    return 0;
  }
  void addQuantity(String id){
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].sid == id){
        int quantity = int.parse(_cart[i].quantity) + 1;
        _cart[i].quantity = quantity.toString();
      }
    }
    notifyListeners();
    PrefsHelper.saveCart(jsonEncode(_cart));
  }

  void reduceQuantity(String id){
    for(int i=0;i<_cart.length;i++){
      if(_cart[i].sid == id){
        int quantity = int.parse(_cart[i].quantity) - 1;
        if(quantity == 0){
          deleteItem(id);
        }else{
          _cart[i].quantity = quantity.toString();
        }

      }
    }
    notifyListeners();
    PrefsHelper.saveCart(jsonEncode(_cart));
  }


  void flushCart() async{
    _cart.removeRange(0, _cart.length);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("CART", "");
  }

}