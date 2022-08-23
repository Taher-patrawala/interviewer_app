import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_app/bloc/rating_bloc/rating_event.dart';
import 'package:interview_app/bloc/rating_bloc/rating_state.dart';
import 'package:interview_app/constants/static_data.dart';
import 'package:interview_app/model/qualities_model.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc()
      : super(
            SelectRatingState(selectedRating: StaticData.createRatings()[0])) {
    on<SelectRating>(_selectedRatingState);
    on<NavigateToToQualities>(_navigateToQualities);
    on<UpdateQualities>(_updateQualities);
  }

  void _selectedRatingState(
      SelectRating event, Emitter<RatingState> emit) async {
    emit(SelectRatingState(selectedRating: event.selectedRating));
  }

  void _navigateToQualities(
      NavigateToToQualities event, Emitter<RatingState> emit) async {
    emit(SelectQualitiesState(qualities: []));
  }

  void _updateQualities(
      UpdateQualities event, Emitter<RatingState> emit) async {
    List<Qualities> selectedQualities =
        List.from((state as SelectQualitiesState).qualities.toList());
    if (selectedQualities.contains(event.quality)) {
      selectedQualities.remove(event.quality);
    } else {
      selectedQualities.add(event.quality);
    }
    print(selectedQualities);
    emit(SelectQualitiesState(qualities: selectedQualities));
  }
}
