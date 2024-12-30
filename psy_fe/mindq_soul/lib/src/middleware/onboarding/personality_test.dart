import 'dart:convert';
import '../../api_client.dart';
import '../../models/question.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class PersonalityTestService {
  final ApiClient _apiClient;
  final _storage = const FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  PersonalityTestService(this._apiClient);

  Future<List<Question>> getQuestions() async {

    final token = await _storage.read(key: _tokenKey);

    final response = await http.get(
      Uri.parse('${_apiClient.baseUrl}/questions'),
      headers: {'Authorization': 'Bearer $token'}, // Include the token in the header
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((questionJson) => Question.fromJson(questionJson)).toList();
    } else {
      throw ApiException('Failed to load questions: ${response.statusCode}');
    }
  }

  Future<void> submitAnswers(Map<int, double> answers) async {

    final token = await _storage.read(key: _tokenKey);
    final response = await http.post(
      Uri.parse('${_apiClient.baseUrl}/answers'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(answers),
    );

    if (response.statusCode != 200) {
      throw ApiException('Failed to submit answers: ${response.statusCode}');
    }
  }
}