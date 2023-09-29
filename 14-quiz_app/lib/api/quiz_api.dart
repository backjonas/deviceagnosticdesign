import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/question.dart';
import '../models/topic.dart';

const String baseUrl = 'https://dad-quiz-api.deno.dev';

class QuizApi {
  Future<List<Topic>> findAllTopics() async {
    final response = await http.get(
      Uri.parse('$baseUrl/topics'),
    );

    List<dynamic> topicItems = jsonDecode(response.body);
    return List<Topic>.from(topicItems.map(
      (jsonData) => Topic.fromJson(jsonData),
    ));
  }

  Future<Question> findQuestion(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/topics/$id/questions'),
    );
    return Question.fromJson(jsonDecode(response.body));
  }

  Future<bool> getResult(String answer, String answerPath) async {
    final data = {"answer": answer};

    final response = await http.post(
      Uri.parse('$baseUrl$answerPath'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(data),
    );
    return jsonDecode(response.body)['correct'];
  }
}
