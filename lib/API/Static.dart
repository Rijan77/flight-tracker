import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Model.dart';

class ApiService {
  static String apiKey = "5c7a4aa3aa3fc784cdeb16f5e046313e";
  static String apiUrl = "http://api.aviationstack.com/v1/flights?access_key=$apiKey";

  static Future<List<Data>> fetchFlights() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);

        // Assuming the response contains a 'data' field that is a list of flights
        List<Data> flights = (jsonData['data'] as List)
            .map((flightJson) => Data.fromJson(flightJson))
            .toList();

        return flights;
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
