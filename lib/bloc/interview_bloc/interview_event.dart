abstract class InterviewerEvent {
  const InterviewerEvent();
}

class GetInterviewerList extends InterviewerEvent {}

class FilterInterviewerList extends InterviewerEvent {
  final String? filterName;

  FilterInterviewerList({this.filterName});
}

class UpdateInterviewerToList extends InterviewerEvent {
  final String number;

  UpdateInterviewerToList({required this.number});
}
