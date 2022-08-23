import 'package:equatable/equatable.dart';
import 'package:interview_app/model/response_model.dart';

abstract class InterviewerScreenState extends Equatable {}

class InterviewerLoadingScreenState extends InterviewerScreenState {
  @override
  List<Object?> get props => [];
}

class InterviewerLoadedScreenState extends InterviewerScreenState {
  final List<Response>? interviewers;
  final List<Response>? selectedInterviewers;

  InterviewerLoadedScreenState( {
    this.interviewers,
    this.selectedInterviewers,
  });

  @override
  List<Object?> get props => [interviewers,selectedInterviewers];
}

class InterviewerErrorScreenState extends InterviewerScreenState {
  final String message;

  InterviewerErrorScreenState({required this.message});

  @override
  List<Object?> get props => [message];
}
