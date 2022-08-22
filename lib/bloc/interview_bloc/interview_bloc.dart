import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_event.dart';
import 'package:interview_app/bloc/interview_bloc/interview_state.dart';
import 'package:interview_app/repository/data_repo.dart';

class InterviewerBloc extends Bloc<InterviewerEvent, InterviewerScreenState> {
  final DataRepo repo = DataRepo();

  InterviewerBloc() : super(InterviewerLoadingScreenState()) {
    on<GetInterviewerList>((event, emit) async {
      try {
        final interviewerList = await repo.getInterviewerList();
        emit(InterviewerLoadedScreenState(
            interviewers: interviewerList, selectedInterviewers: []));
      } catch (e) {
        // print(e);
        emit(InterviewerErrorScreenState(
            message: "Error occurred while fetching data!"));
      }
    });

    on<UpdateInterviewerToList>((event, emit) async {
      List<String> selectedInterviewers = List.from(
          (state as InterviewerLoadedScreenState)
              .selectedInterviewers!
              .toList());
      if (selectedInterviewers.contains(event.number)) {
        selectedInterviewers.remove(event.number);
      } else {
        selectedInterviewers.add(event.number);
      }
      print(selectedInterviewers);
      emit(InterviewerLoadedScreenState(
          interviewers: (state as InterviewerLoadedScreenState).interviewers,
          selectedInterviewers: selectedInterviewers));
    });
  }
}
