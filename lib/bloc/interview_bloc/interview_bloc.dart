import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_event.dart';
import 'package:interview_app/bloc/interview_bloc/interview_state.dart';
import 'package:interview_app/model/response_model.dart';
import 'package:interview_app/repository/data_repo.dart';

class InterviewerBloc extends Bloc<InterviewerEvent, InterviewerScreenState> {
  final DataRepo repo = DataRepo();
  List<Response>? interviewerList = [];

  InterviewerBloc() : super(InterviewerLoadingScreenState()) {
    on<GetInterviewerList>(_getInterviewersList);
    on<FilterInterviewerList>(_getFilteredInterviewerList);
    on<UpdateInterviewerToList>(_updateSelectedInterviewerList);
  }

  void _getInterviewersList(
      GetInterviewerList event, Emitter<InterviewerScreenState> emit) async {
    try {
      interviewerList = await repo.getInterviewerList();
      emit(InterviewerLoadedScreenState(
          interviewers: interviewerList, selectedInterviewers: []));
    } catch (e) {
      emit(InterviewerErrorScreenState(
          message: "Error occurred while fetching data!"));
    }
  }

  void _getFilteredInterviewerList(
      FilterInterviewerList event, Emitter<InterviewerScreenState> emit) async {
    List<Response>? filteredList = interviewerList;
    filteredList = interviewerList!
        .where((element) => element.name!.firstName!
            .toLowerCase()
            .contains(event.filterName!.toLowerCase()))
        .toList();
    if (event.filterName == null || event.filterName!.isEmpty) {
      filteredList = interviewerList;
    }
    emit(InterviewerLoadedScreenState(
        interviewers: filteredList,
        selectedInterviewers:
            (state as InterviewerLoadedScreenState).selectedInterviewers));
  }

  void _updateSelectedInterviewerList(UpdateInterviewerToList event,
      Emitter<InterviewerScreenState> emit) async {
    List<Response> selectedInterviewers = List.from(
        (state as InterviewerLoadedScreenState).selectedInterviewers!.toList());
    if (selectedInterviewers.contains(event.interviewer)) {
      selectedInterviewers.remove(event.interviewer);
    } else {
      selectedInterviewers.add(event.interviewer);
    }
    emit(InterviewerLoadedScreenState(
        interviewers: (state as InterviewerLoadedScreenState).interviewers,
        selectedInterviewers: selectedInterviewers));
  }
}
