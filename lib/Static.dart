import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String apiUrl = 'https://api.aviationstack.com/v1/flights?access_key=a3e2b1ce7990a9b80dd58876e402b258';
  static const String apiUrl2 = 'https://api.aviationstack.com/v1/flights?access_key=a3e2b1ce7990a9b80dd58876e402b258';

  static Future<List<dynamic>> fetchFlights() async {

    try {
      final responses = await Future.wait([
      http.get(Uri.parse(apiUrl)),
      http.get(Uri.parse(apiUrl2)),
    ]);

      List<dynamic> flights =[];

      for (var response in responses){
        if(response.statusCode == 200){
          final data = json.decode(response.body);
          flights.addAll(data['data']??[]);
        }else{
          print("Failed to load flights: ${response.statusCode}");
        }
      }
      return flights;
    } catch (e) {
      print("error occurred: $e");
      return [];
    }
  }
}





