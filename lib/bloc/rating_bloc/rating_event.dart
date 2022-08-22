abstract class RatingEvent {
  const RatingEvent();
}

class SelectRating extends RatingEvent {
  final int selectedIndex;

  SelectRating({required this.selectedIndex});
}
