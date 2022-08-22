import 'package:interview_app/model/interviewer_model.dart';

class Response {
  Interviewers? name;
  String? cell;

  Response.fromJson(Map<String, dynamic> json) {
    name = Interviewers.fromJson(json["name"]);
    cell = json['cell'];
  }
}
