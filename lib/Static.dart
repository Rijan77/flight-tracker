import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String apiUrl = 'https://api.aviationstack.com/v1/flights?access_key=d86d77166fba00bcac0ec146b6ff9522';
  // static const String apiUrl2 = 'https://api.aviationstack.com/v1/flights?access_key=d86d77166fba00bcac0ec146b6ff9522';

  static Future<List<dynamic>> fetchFlights() async {

    try {
      final responses = await Future.wait([
      http.get(Uri.parse(apiUrl)),
      // http.get(Uri.parse(apiUrl2)),
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
      print("An error occurred: $e");
      return [];
    }
  }
}





