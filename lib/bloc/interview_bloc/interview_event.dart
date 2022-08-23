import 'package:interview_app/model/response_model.dart';

abstract class InterviewerEvent {
  const InterviewerEvent();
}

class GetInterviewerList extends InterviewerEvent {}

class FilterInterviewerList extends InterviewerEvent {
  final String? filterName;

  FilterInterviewerList({this.filterName});
}

class UpdateInterviewerToList extends InterviewerEvent {
  // final String number;
  final Response interviewer;

  UpdateInterviewerToList({required this.interviewer});
}
