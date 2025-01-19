import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = "https://api.jsonserve.com/Uw5CrX";

  Future<List<dynamic>> fetchQuestions() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['questions'];
      } else {
        throw Exception("Failed to load questions");
      }
    } catch (error) {
      throw Exception("Error: $error");
    }
  }
}
