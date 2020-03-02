import 'package:http/http.dart' as http;

class ApiService {
  
  final _baseUrl = 'https://pokeapi.co/api/v2/';
  Map<String, String> get _headers =>
      {'Content-Type': 'application/json'};

  Future<String> fetchData(String endpoint) async {
    http.Response results = await http.get(_baseUrl + endpoint);

    if (results.statusCode == 200) {
      return results.body;
    } else {
      final errorMessage = 'Error! statusCode ${results.statusCode}';
      return errorMessage;
    }
  }
}