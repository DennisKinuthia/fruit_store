import 'package:flutter/material.dart';

typedef ProductID = String;

class Product {
  Product({
    required this.productId,
    required this.name,
    required this.price,
    required this.color,
    required this.image,
    required this.package,
    required this.description,
  });
  final ProductID productId;
  final String name;
  final double price;
  final Color color;
  final String image;
  final String package;
  final String description;
}
