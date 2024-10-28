import 'package:flutter/material.dart';

class Food {
  final String imageURL;
  final String name;
  final int price;
  final double rating;
  final Color color;

  Food({
    required this.imageURL,
    required this.name,
    required this.price,
    required this.rating,
    required this.color,
  });
}
