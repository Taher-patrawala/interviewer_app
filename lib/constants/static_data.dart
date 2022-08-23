import 'package:flutter/material.dart';
import 'package:interview_app/model/qualities_model.dart';
import 'package:interview_app/model/rating_model.dart';

class StaticData {
  static List<Rating> createRatings() {
    return [
      Rating(
        id: 0,
        title: "Awesome",
        description: "Best Interview Ever",
        image: "clap.png",
        borderColor: Colors.indigo,
      ),
      Rating(
        id: 1,
        title: "Good",
        description: "Nice Person.really Nice!",
        image: "good.png",
        borderColor: Colors.green,
      ),
      Rating(
        id: 2,
        title: "Neutral",
        description: "Best Interview Ever",
        image: "neutral.png",
        borderColor: Colors.grey,
      ),
      Rating(
        id: 3,
        title: "Bad",
        description: "Best Interview Ever",
        image: "sad.png",
        borderColor: Colors.redAccent,
      ),
    ];
  }

  static List<Qualities> createQualities() {
    return [
      Qualities(id: 0, name: "Politeness"),
      Qualities(id: 1, name: "Expertise"),
      Qualities(id: 2, name: "Guidance"),
      Qualities(id: 3, name: "Questions Asked"),
      Qualities(id: 3, name: "Professionalism"),
      Qualities(id: 3, name: "Attentiveness"),
      Qualities(id: 3, name: "Quality of Question"),
    ];
  }
}
