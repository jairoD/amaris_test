import 'package:amaris_test/utils/const.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double rating;
  const Rating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(5, (index) {
      if (rating - 1 > index) {
        return Icon(
          Icons.star,
          color: amarisYellow,
          size: 15,
        );
      } else {
        return Icon(Icons.star, color: amarisYellow.withOpacity(0.6), size: 15);
      }
    }));
  }
}
