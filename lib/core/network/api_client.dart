import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future<String> fetchNews() async {
    final response = await httpClient.get(Uri.parse('https://newsapi.org/v1/articles?source=the-next-web&apiKey=1c0f731cca954a13875e6965f9c7e9de'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
