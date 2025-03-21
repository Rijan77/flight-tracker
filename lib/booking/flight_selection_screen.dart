import 'package:flutter/material.dart';

import 'PassengerContactFormScreen.dart';


class FlightSelectionScreen extends StatelessWidget {
  final String from;
  final String to;
  final String departureDate;
  final String? returnDate; // Nullable returnDate
  final int passengers;

  // Modified constructor
  FlightSelectionScreen({super.key, 
    required this.from,
    required this.to,
    required this.departureDate,
    this.returnDate, // Return date is optional
    required this.passengers,
  });

  // The flight data (for demonstration purposes)
  final List<Map<String, String>> flights = List.generate(15, (index) {
    List<String> places = [
      "Kathmandu", "Pokhara", "Bhairahwa", "Dhangadi", "Biratnagar", "Nepalgunj", "Janakpur"
    ];
    List<String> airlines = ["Air Nepal", "Himalaya Airlines", "Buddha Air", "Yeti Airlines"];

    return {
      'flightNumber': 'FL${100 + index}',
      'from': places[index % places.length],
      'to': places[(index + 1) % places.length],
      'departureTime': '${(6 + index % 12)}:${(index % 2) * 30} AM',
      'arrivalTime': '${(7 + index % 12)}:${(index % 2) * 30} AM',
      'duration': '1h 00m',
      'airline': airlines[index % airlines.length],
      'price': '${4000 + (index % 5) * 500} NPR',
      'availableSeats': '${5 + index % 10}',
      'baggage': '10kg carry-on',
    };
  });

  List<Map<String, String>> getFilteredFlights() {
    return flights.where((flight) => flight['from'] == from && flight['to'] == to).toList();
  }

  void bookFlight(BuildContext context, Map<String, String> flight) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PassengerContactFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredFlights = getFilteredFlights();

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Flight'),
        backgroundColor: Color(0xff486C8F),
      ),

      body: filteredFlights.isEmpty
          ? Center(
        child: Text(
          'No Flights Found',
          style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        itemCount: filteredFlights.length,
        itemBuilder: (context, index) {
          final flight = filteredFlights[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(12),
              title: Text('${flight['flightNumber']} - ${flight['airline']}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueAccent)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('From: ${flight['from']} → To: ${flight['to']}'),
                  Text('Departure: ${flight['departureTime']} | Arrival: ${flight['arrivalTime']}'),
                  Text('Duration: ${flight['duration']}'),
                  Text('Price: ${flight['price']}'),
                  Text('Available Seats: ${flight['availableSeats']}'),
                  Text('Baggage Info: ${flight['baggage']}'),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () => bookFlight(context, flight),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Book Now'),
              ),
            ),
          );
        },
      ),
    );
  }
}