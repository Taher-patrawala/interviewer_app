abstract class InterviewerEvent {
  const InterviewerEvent();
}

class GetInterviewerList extends InterviewerEvent {}

class UpdateInterviewerToList extends InterviewerEvent {
  final String number;

  UpdateInterviewerToList({required this.number});
}
