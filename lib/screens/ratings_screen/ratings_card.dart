import 'package:flutter/material.dart';
import 'package:interview_app/constants/colors.dart';
import 'package:interview_app/model/rating_model.dart';

class RatingCard extends StatelessWidget {
  final bool isSelected;
  final Rating rating;

  const RatingCard({
    Key? key,
    required this.isSelected,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: !isSelected
              ? rating.borderColor ?? Colors.transparent
              : Colors.transparent,
        ),
      ),
      color: isSelected ? AppColors.ratingColor : Colors.transparent,
      margin: EdgeInsets.zero,
      elevation: isSelected ? 8 : 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                "assets/images/${rating.image}",
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rating.title ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    rating.description ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
