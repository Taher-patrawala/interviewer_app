import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_event.dart';
import 'package:interview_app/bloc/interview_bloc/interview_state.dart';
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
            Text(
              interviewer!.name!.firstName ?? "",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
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
                  state.selectedInterviewers!.contains(interviewer!.cell);
            }
            return InkWell(
              onTap: () {
                context.read<InterviewerBloc>().add(
                      UpdateInterviewerToList(number: interviewer!.cell!),
                    );
              },
              child: Text(
                isSelected ? "Remove" : "Add",
              ),
            );
          },
        ),
      ],
    );
  }
}
