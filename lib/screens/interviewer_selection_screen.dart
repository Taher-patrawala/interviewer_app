import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_event.dart';
import 'package:interview_app/bloc/interview_bloc/interview_state.dart';
import 'package:interview_app/model/response_model.dart';
import 'package:interview_app/screens/widgets/interviewerItem.dart';

class InterviewerSelection extends StatelessWidget {
  const InterviewerSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => InterviewerBloc(),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 24, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Interviewers",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                TextFormField(),
                const SizedBox(height: 16),
                const Text("0 Added"),
                const SizedBox(height: 16),
                BlocBuilder<InterviewerBloc, InterviewerScreenState>(
                    builder: (context, state) {
                  if (state is InterviewerLoadingScreenState) {
                    context.read<InterviewerBloc>().add(GetInterviewerList());
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
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        
        icon: const Icon(Icons.chevron_right),
        label: const Text("Next"),
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
}
