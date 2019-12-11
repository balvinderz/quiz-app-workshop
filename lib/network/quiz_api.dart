import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:quizapp/models/question.dart';
import 'dart:convert' as json;
class QuizApi{
  http.Client _client ;
  QuizApi(){
    _client = http.Client();
  }
  Future<List<Question>> getQuestions() async
  {
      String questionsUrl = "http://192.168.1.105:8080/";
      http.Response response = await http.get(questionsUrl);
      String jsonResponse = response.body;
      List<dynamic> jsonData = json.jsonDecode(jsonResponse);
      print(jsonData);
      List<Question> questions = jsonData.map((json)=> Question.fromJson(json)).toList();
      return questions;
  }

}