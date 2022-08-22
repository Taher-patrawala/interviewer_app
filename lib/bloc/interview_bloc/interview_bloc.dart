import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/interview_bloc/interview_event.dart';
import 'package:interview_app/bloc/interview_bloc/interview_state.dart';
import 'package:interview_app/repository/data_repo.dart';

class InterviewerBloc extends Bloc<InterviewerEvent, InterviewerScreenState> {
  final DataRepo repo = DataRepo();

  InterviewerBloc() :super(InterviewerLoadingScreenState()) {
    on<GetInterviewerList>((event,emit) async {
      try {
        final interviewerList = await repo.getInterviewerList();
        emit(InterviewerLoadedScreenState(
            interviewers: interviewerList));
      } catch (e) {
        // print(e);
        emit(InterviewerErrorScreenState(message:"Error occurred while fetching data!"));
      }
    });
  }
}

// void getInterviewers(){
//
// }
