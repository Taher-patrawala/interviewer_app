import 'dart:convert';

import 'package:interview_app/model/response_model.dart';
import 'package:http/http.dart' as http;

class DataRepo {
  Future<List<Response>?> getInterviewerList() async {
    final http.Response response = await http.get(Uri.parse(
        "https://randomuser.me/api/?seed=ab&inc=name,cell&results=20"));
    return List<Response>.from(jsonDecode(response.body)["results"].map((item){
      return Response.fromJson(item);
    })).toList();
  }
}
