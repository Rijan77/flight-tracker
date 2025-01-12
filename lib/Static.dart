import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String apiUrl = 'https://api.aviationstack.com/v1/flights?access_key=223cc312a57647ed3fd4d3d1e4da80b7';

  static Future<List<dynamic>> fetchFlights() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // Parse the JSON response
        final data = json.decode(response.body);
        return data['data'] ?? []; // Return flight data list
      } else {
        print("Failed to load flights: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("An error occurred: $e");
      return [];
    }
  }
}





