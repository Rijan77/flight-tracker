import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
 static String apiKey = "5c7a4aa3aa3fc784cdeb16f5e046313e";
 static String apiUrl = "http://api.aviationstack.com/v1/flights?access_key=$apiKey";

  static Future<List<dynamic>> fetchFlights() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

        if(response.statusCode == 200){
          final data = json.decode(response.body);
          print(data);
          return data['date'] ?? [];

        }else{
          print("Failed to load flights: ${response.statusCode}");
          return [];
        }
    } catch (e) {
      print("An error occurred: $e");
      return [];
    }
  }
}





