import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_event.dart';
import 'package:interview_app/bloc/interview_bloc/interview_state.dart';
import 'package:interview_app/colors.dart';
import 'package:interview_app/model/response_model.dart';

class InterviewerItem extends StatelessWidget {
  final Response? interviewer;

  const InterviewerItem({
    Key? key,
    this.interviewer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<InterviewerBloc, InterviewerScreenState>(
              builder: (context, state) {
                bool isSelected = false;
                if (state is InterviewerLoadedScreenState) {
                  isSelected =
                      state.selectedInterviewers!.contains(interviewer!);
                }
                return Text(
                  interviewer!.name!.firstName ?? "",
                  style:  TextStyle(
                    fontSize: 18,
                    fontWeight: isSelected?FontWeight.w800:FontWeight.w500,
                    color: isSelected?AppColors.selectedInterviewer:AppColors.titleColor
                  ),
                );
              },
            ),
            const SizedBox(height: 4),
            Text(
              interviewer!.cell ?? "",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        BlocBuilder<InterviewerBloc, InterviewerScreenState>(
          builder: (context, state) {
            bool isSelected = false;
            if (state is InterviewerLoadedScreenState) {
              isSelected =
                  state.selectedInterviewers!.contains(interviewer!);
            }
            return InkWell(
              onTap: () {
                context.read<InterviewerBloc>().add(
                      UpdateInterviewerToList(interviewer: interviewer!),
                    );
              },
              child: Text(
                isSelected ? "REMOVE" : "ADD",
                style: TextStyle(
                    color: AppColors.titleColor,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline),
              ),
            );
          },
        ),
      ],
    );
  }
}
