import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_event.dart';
import 'package:interview_app/bloc/interview_bloc/interview_state.dart';
import 'package:interview_app/constants/colors.dart';
import 'package:interview_app/model/response_model.dart';
import 'package:interview_app/screens/ratings_screen.dart';
import 'package:interview_app/screens/widgets/button.dart';
import 'package:interview_app/screens/interview_screen/interviewerItem.dart';

class InterviewerSelection extends StatelessWidget {
  const InterviewerSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InterviewerBloc(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Interviewers",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: AppColors.titleColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _searchBar(),
                    const SizedBox(height: 20),
                    const SizedBox(height: 16),
                    BlocBuilder<InterviewerBloc, InterviewerScreenState>(
                      builder: (context, state) {
                        if (state is InterviewerLoadedScreenState) {
                          return Text(
                            "${state.selectedInterviewers!.length} ADDED",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: AppColors.infoColor,
                                fontSize: 14),
                          );
                        }
                        return const Text("0 ADDED");
                      },
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<InterviewerBloc, InterviewerScreenState>(
                        builder: (context, state) {
                      if (state is InterviewerLoadingScreenState) {
                        context
                            .read<InterviewerBloc>()
                            .add(GetInterviewerList());
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is InterviewerLoadedScreenState) {
                        return _buildBody(state.interviewers!);
                      } else if (state is InterviewerErrorScreenState) {
                        return Center(
                          child: Text(state.message.toString()),
                        );
                      } else {
                        return Container();
                      }
                    })
                  ],
                ),
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child: BlocBuilder<InterviewerBloc, InterviewerScreenState>(
                  builder: (context, state) {
                    return Button(
                      isDisabled: ((state is InterviewerLoadedScreenState) &&
                          state.selectedInterviewers!.length == 0),
                      onTap: () {
                        if ((state is InterviewerLoadedScreenState) &&
                            state.selectedInterviewers!.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RatingsScreen()),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(List<Response> interviewers) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InterviewerItem(
              interviewer: interviewers[index],
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16);
          },
          itemCount: interviewers.length),
    );
  }

  Widget _searchBar() {
    return BlocBuilder<InterviewerBloc, InterviewerScreenState>(
      builder: (context, state) {
        return Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          child: TextField(
            decoration: InputDecoration(
              fillColor: AppColors.searchBackground,
              filled: true,
              hintText: "Search Interviewers",
              hintStyle: TextStyle(
                  color: AppColors.infoColor.withOpacity(0.6),
                  fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.transparent)),
              suffixIcon: Icon(
                Icons.search,
                color: AppColors.dimGrey,
              ),
            ),
            onChanged: (text) {
              context
                  .read<InterviewerBloc>()
                  .add(FilterInterviewerList(filterName: text));
            },
          ),
        );
      },
    );
  }
}
