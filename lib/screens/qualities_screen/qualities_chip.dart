import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_event.dart';
import 'package:interview_app/bloc/rating_bloc/rating_state.dart';
import 'package:interview_app/constants/colors.dart';
import 'package:interview_app/model/qualities_model.dart';

class QualitiesChip extends StatelessWidget {
  final Qualities item;

  const QualitiesChip({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingBloc, RatingState>(
      builder: (context, state) {
        bool isSelected = false;
        isSelected =
            state is SelectQualitiesState && (state).qualities.contains(item);

        return Container(
          padding: const EdgeInsets.all(2.0),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: ChoiceChip(
            label: Text(
              item.name!,
              style: TextStyle(
                color: isSelected
                    ? AppColors.selectedBorderGreen
                    : AppColors.dimGrey,
              ),
            ),
            selected: isSelected,
            onSelected: (selected) {
              if (state is SelectQualitiesState) {
                context.read<RatingBloc>().add(UpdateQualities(quality: item));
              }
            },
            backgroundColor: AppColors.scaffoldBackground,
            selectedColor: AppColors.selectedGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(
                width: 1.5,
                color: isSelected
                    ? AppColors.selectedBorderGreen
                    : AppColors.dimGrey.withOpacity(0.5),
              ),
            ),
          ),
        );
      },
    );
  }
}
