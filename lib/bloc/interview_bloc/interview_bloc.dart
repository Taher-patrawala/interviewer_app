import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_event.dart';
import 'package:interview_app/bloc/interview_bloc/interview_state.dart';
import 'package:interview_app/model/response_model.dart';
import 'package:interview_app/repository/data_repo.dart';

class InterviewerBloc extends Bloc<InterviewerEvent, InterviewerScreenState> {
  final DataRepo repo = DataRepo();
  List<Response>? interviewerList = [];

  InterviewerBloc() : super(InterviewerLoadingScreenState()) {
    on<GetInterviewerList>((event, emit) async {
      try {
        interviewerList = await repo.getInterviewerList();
        emit(InterviewerLoadedScreenState(
            interviewers: interviewerList, selectedInterviewers: []));
      } catch (e) {
        // print(e);
        emit(InterviewerErrorScreenState(
            message: "Error occurred while fetching data!"));
      }
    });

    on<FilterInterviewerList>((event, emit) async {
      List<Response>? filteredList = interviewerList;
      filteredList = interviewerList!
          .where((element) => element.name!.firstName!.contains(event.filterName!))
          .toList();
      // print(filteredList);
      if (event.filterName == null || event.filterName!.isEmpty) {
        filteredList = interviewerList;
      }
      emit(InterviewerLoadedScreenState(
          interviewers: filteredList,
          selectedInterviewers:
              (state as InterviewerLoadedScreenState).selectedInterviewers));
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
      // print(selectedInterviewers);
      emit(InterviewerLoadedScreenState(
          interviewers: (state as InterviewerLoadedScreenState).interviewers,
          selectedInterviewers: selectedInterviewers));
    });
  }
}
