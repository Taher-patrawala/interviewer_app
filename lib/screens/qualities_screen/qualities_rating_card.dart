import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_event.dart';
import 'package:interview_app/bloc/rating_bloc/rating_state.dart';
import 'package:interview_app/model/rating_model.dart';

class QualitiesRatingCard extends StatelessWidget {
  final Rating rating;

  const QualitiesRatingCard({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/${rating.image}",
            height: 48,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rating.title ?? "",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                rating.description ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              context.read<RatingBloc>().add(SelectRating(selectedRating: rating));
              Navigator.pop(context);
            },
            child: const Text(
              "CHANGE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
