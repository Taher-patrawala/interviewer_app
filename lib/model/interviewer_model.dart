class Interviewers{
  String? firstName;
  String? lastName;
  String? title;

  Interviewers.fromJson(Map<String,dynamic> json){
    title = json['title'];
    firstName = json['first'];
    lastName = json['last'];
  }
}