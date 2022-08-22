import 'package:flutter/material.dart';

class Rating {
  final int id;
  final String? title;
  final String? description;
  final String? image;
  final Color? borderColor;

  Rating({
    required this.id,
    this.title,
    this.description,
    this.image,
    this.borderColor,
  });
}
