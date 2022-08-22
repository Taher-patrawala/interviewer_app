import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_event.dart';
import 'package:interview_app/bloc/rating_bloc/rating_state.dart';
import 'package:interview_app/model/rating_model.dart';

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Rating> rating = _createRatings();
    return BlocProvider(
      create: (context) => RatingBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "How would you rate your interviewer(s)?",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Select your Rating",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: 0.85),
                  itemBuilder: (context, index) {
                    return _ratingCard(rating[index], index);
                  },
                  itemCount: 4,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RatingsScreen()),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          icon: const Icon(Icons.chevron_right),
          label: const Text("Next"),
        ),
      ),
    );
  }

  List<Rating> _createRatings() {
    return [
      Rating(
        title: "Awesome",
        description: "Best Interview Ever",
        image: "clap.png",
        borderColor: Colors.indigo,
      ),
      Rating(
        title: "Good",
        description: "Nice Person.really Nice!",
        image: "good.png",
        borderColor: Colors.green,
      ),
      Rating(
        title: "Neutral",
        description: "Best Interview Ever",
        image: "neutral.png",
        borderColor: Colors.grey,
      ),
      Rating(
        title: "Bad",
        description: "Best Interview Ever",
        image: "sad.png",
        borderColor: Colors.redAccent,
      ),
    ];
  }

  Widget _ratingCard(Rating rating, int index) {
    return BlocBuilder<RatingBloc, RatingState>(
      builder: (context, state) {
        bool isSelected = false;
        if ((state is SelectRatingState) && state.selectedIndex == index) {
          isSelected = true;
        }
        return InkWell(
          onTap: () {
            context.read<RatingBloc>().add(SelectRating(selectedIndex: index));
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(
                color: !isSelected
                    ? rating.borderColor ?? Colors.transparent
                    : Colors.transparent,
              ),
            ),
            color: isSelected ? Colors.blue : Colors.transparent,
            margin: EdgeInsets.zero,
            elevation: isSelected ? 8 : 0,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      "assets/images/${rating.image}",
                      // height: 74,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    rating.title ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
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
            ),
          ),
        );
      },
    );
  }
}
