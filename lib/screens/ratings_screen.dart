import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_event.dart';
import 'package:interview_app/bloc/rating_bloc/rating_state.dart';
import 'package:interview_app/colors.dart';
import 'package:interview_app/model/rating_model.dart';
import 'package:interview_app/screens/qualities_screen.dart';
import 'package:interview_app/screens/widgets/button.dart';

class RatingsScreen extends StatelessWidget {
  const RatingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Rating> rating = _createRatings();
    return BlocProvider(
      create: (_) => RatingBloc(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 18, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How would you rate your interviewer(s)?",
                        style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                            color: AppColors.titleColor),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Select your Rating".toUpperCase(),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: AppColors.infoColor),
                      ),
                      const SizedBox(height: 18),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                Positioned(
                  bottom: 24,
                  right: 24,
                  left: 24,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "GO BACK",
                          style:  TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                      BlocBuilder<RatingBloc, RatingState>(
                        builder: (context, state) {
                          return Button(
                            isDisabled: ((state is SelectRatingState) &&
                                state.selectedRating!.id == -1),
                            onTap: () {
                              Rating selectedRating = (context
                                      .read<RatingBloc>()
                                      .state as SelectRatingState)
                                  .selectedRating!;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      QualitiesScreen(rating: selectedRating),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Rating> _createRatings() {
    return [
      Rating(
        id: 0,
        title: "Awesome",
        description: "Best Interview Ever",
        image: "clap.png",
        borderColor: Colors.indigo,
      ),
      Rating(
        id: 1,
        title: "Good",
        description: "Nice Person.really Nice!",
        image: "good.png",
        borderColor: Colors.green,
      ),
      Rating(
        id: 2,
        title: "Neutral",
        description: "Best Interview Ever",
        image: "neutral.png",
        borderColor: Colors.grey,
      ),
      Rating(
        id: 3,
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
        if ((state is SelectRatingState) && state.selectedRating!.id == index) {
          isSelected = true;
        }
        return InkWell(
          onTap: () {
            context
                .read<RatingBloc>()
                .add(SelectRating(selectedRating: rating));
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
          ),
        );
      },
    );
  }
}
