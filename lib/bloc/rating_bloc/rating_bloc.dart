import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_event.dart';
import 'package:interview_app/bloc/rating_bloc/rating_state.dart';
import 'package:interview_app/model/qualities_model.dart';
import 'package:interview_app/model/rating_model.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc() : super(SelectRatingState(selectedRating: Rating(id: -1))) {
    on<SelectRating>((event, emit) {
      emit(SelectRatingState(selectedRating: event.selectedRating));
    });

    on<NavigateToToQualities>((event, emit) {
      emit(SelectQualitiesState(qualities: []));
    });

    on<UpdateQualities>((event, emit) {
      List<Qualities> selectedQualities =
          List.from((state as SelectQualitiesState).qualities.toList());
      if (selectedQualities.contains(event.quality)) {
        selectedQualities.remove(event.quality);
      } else {
        selectedQualities.add(event.quality);
      }
      print(selectedQualities);
      emit(SelectQualitiesState(qualities: selectedQualities));
    });
  }
}
