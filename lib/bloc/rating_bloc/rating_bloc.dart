import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_event.dart';
import 'package:interview_app/bloc/rating_bloc/rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc() : super(SelectRatingState(selectedIndex: -1)) {
    on<SelectRating>((event, emit) {
      emit(SelectRatingState(selectedIndex: event.selectedIndex));
    });
  }
}
