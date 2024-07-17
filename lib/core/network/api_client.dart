import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ApiClient {
  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future<String> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/sample_response.json');
    // print('response: $response');
    return response;
    
  }

  Future<String> fetchNews() async {
    final response = await httpClient.get(Uri.parse('https://newsapi.org/v1/articles?source=the-next-web&apiKey=1c0f731cca954a13875e6965f9c7e9de'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw Exception('Failed to load news');
      var res = loadJsonData();
      return res;
    }
  }
}
