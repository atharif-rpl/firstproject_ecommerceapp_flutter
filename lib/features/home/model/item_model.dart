
import 'package:flutter/material.dart';

class ItemFoodModel{
  final String imagePath;
  final String name;
  final String price;
  Color? bgColor = Color(0xffFFFFFF);

  ItemFoodModel({
    required this.imagePath,
    required this.name,
    required this.price,
    this.bgColor
  });

  get rating => null;
}