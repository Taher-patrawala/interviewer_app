import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_event.dart';
import 'package:interview_app/bloc/rating_bloc/rating_state.dart';
import 'package:interview_app/model/qualities_model.dart';
import 'package:interview_app/model/rating_model.dart';

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
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<RatingBloc>(context),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(12))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("You have Rated Your Interviewer"),
                        Card(
                          margin: EdgeInsets.zero,
                          color: Colors.blue,
                          child: _ratingCard(widget.rating),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("What made the interview awesome?"),
                          Wrap(
                            children: _buildChoiceList(_createQualities()),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.comment_outlined),
                          SizedBox(width: 8),
                          Text("ADD COMMENT")
                        ],
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        icon: const Icon(Icons.chevron_right),
                        label: const Text("Next"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Qualities> _createQualities() {
    return [
      Qualities(id: 0, name: "Politeness"),
      Qualities(id: 1, name: "Expertise"),
      Qualities(id: 2, name: "Guidance"),
      Qualities(id: 3, name: "Questions Asked"),
    ];
  }

  _ratingCard(Rating rating) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
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
              const SizedBox(height: 4),
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
          const Text(
            "Change",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  _buildChoiceList(List<Qualities> qualities) {
    List<Widget> choices = [];
    for (var item in qualities) {
      choices.add(
        BlocBuilder<RatingBloc, RatingState>(
          builder: (context, state) {
            bool isSelected = false;
            isSelected = state is SelectQualitiesState &&
                (state as SelectQualitiesState).qualities.contains(item);

            return Container(
              padding: const EdgeInsets.all(2.0),
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(
                label: Text(
                  item.name!,
                  style: TextStyle(
                    color: isSelected ? Colors.green : Colors.black,
                  ),
                ),
                selected: isSelected,
                onSelected: (selected) {
                  if (state is SelectQualitiesState) {
                    context
                        .read<RatingBloc>()
                        .add(UpdateQualities(quality: item));
                  }
                },
                selectedColor: Colors.greenAccent.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(
                    color: isSelected ? Colors.green : Colors.transparent,
                  ),
                ),
              ),
            );
          },
        ),
      );
    }
    return choices;
  }
}
