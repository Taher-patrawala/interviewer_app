import 'package:interview_app/model/qualities_model.dart';
import 'package:interview_app/model/rating_model.dart';

abstract class RatingEvent {
  const RatingEvent();
}

class SelectRating extends RatingEvent {
  final Rating selectedRating;

  SelectRating({required this.selectedRating});
}

class NavigateToToQualities extends RatingEvent {}

class UpdateQualities extends RatingEvent {
  final Qualities quality;

  UpdateQualities({required this.quality});
}
