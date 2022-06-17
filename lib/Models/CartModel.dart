import 'package:flutter/widgets.dart';
class CartModel {
  String name,sid;
  String imageUrl;
  String itemsNo;
  String discount;
  String mrp;
  String quantity;
  String total;
  String price;

  CartModel({required this.name, required this.imageUrl, required this.itemsNo, required this.discount,required this.mrp,
    required this.price,required this.quantity,required this.sid,required this.total});
}