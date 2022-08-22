import 'package:equatable/equatable.dart';

abstract class RatingState extends Equatable {}

class SelectRatingState extends RatingState {
  final int selectedIndex;

  SelectRatingState({this.selectedIndex = -1});

  @override
  List<Object?> get props => [selectedIndex];
}
