import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_event.dart';
import 'package:interview_app/bloc/rating_bloc/rating_state.dart';
import 'package:interview_app/constants/colors.dart';
import 'package:interview_app/constants/static_data.dart';
import 'package:interview_app/model/qualities_model.dart';
import 'package:interview_app/model/rating_model.dart';
import 'package:interview_app/screens/feedback_screen/feedback_screen.dart';
import 'package:interview_app/screens/qualities_screen/qualities_chip.dart';
import 'package:interview_app/screens/qualities_screen/qualities_rating_card.dart';
import 'package:interview_app/screens/thankyou_screen.dart';
import 'package:interview_app/screens/widgets/button.dart';

class QualitiesScreen extends StatefulWidget {
  final Rating rating;

  const QualitiesScreen({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  State<QualitiesScreen> createState() => _QualitiesScreenState();
}

class _QualitiesScreenState extends State<QualitiesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<RatingBloc>().add(NavigateToToQualities());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<RatingBloc>(context),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.headerBackground.withOpacity(0.3),
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(12))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You have Rated Your Interviewer",
                          style: TextStyle(
                              color: AppColors.infoColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 8,
                          margin: EdgeInsets.zero,
                          color: AppColors.ratingColor,
                          child: QualitiesRatingCard(
                            rating: widget.rating,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "What made the interview awesome?",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.titleColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Wrap(
                            children:
                                _buildChoiceList(StaticData.createQualities()),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 24,
                right: 24,
                left: 24,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.comment_outlined),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FeedbackScreen()));
                          },
                          child: const Text(
                            "ADD COMMENT",
                            style: TextStyle(
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    BlocBuilder<RatingBloc, RatingState>(
                      builder: (context, state) {
                        return Button(
                          label: "SUBMIT",
                          icon: Icons.check,
                          isDisabled: false,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ThankYouScreen(),
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
    );
  }

  _buildChoiceList(List<Qualities> qualities) {
    List<Widget> choices = [];
    for (var item in qualities) {
      choices.add(
        QualitiesChip(
          item: item,
        ),
      );
    }
    return choices;
  }
}
