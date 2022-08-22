import 'package:equatable/equatable.dart';
import 'package:interview_app/model/qualities_model.dart';
import 'package:interview_app/model/rating_model.dart';

abstract class RatingState extends Equatable {}

class SelectRatingState extends RatingState {
  final Rating? selectedRating;

  SelectRatingState({this.selectedRating});

  @override
  List<Object?> get props => [selectedRating];
}

class SelectQualitiesState extends RatingState {
  final List<Qualities> qualities;

  SelectQualitiesState({required this.qualities});

  @override
  List<Object?> get props => [qualities];
}
