import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Static.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  List flights = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFlights();
  }


  Future<void> loadFlights() async {
    final fetchFlights = await ApiService.fetchFlights();

    setState(() {
      flights = fetchFlights.sublist(0, 50);
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Flight Details")),
        backgroundColor: const Color(0xff508C9B),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: flights.length,
        itemBuilder: (BuildContext context, int index) {
          final flight = flights[index];
          final airlineName = flight['airline']['name'] ?? 'Unknown Airline';
          final departureAirport = flight['departure']?['airport'] ?? 'Unknown Airport';
          final departureTime = flight['departure']['scheduled'] ?? 'Unknown Date';
          final formattedDate = departureTime != 'Unknown Date'
              ? DateFormat('yyyy-MM-dd \n HH:mm').format(DateTime.parse(departureTime))
              : 'Unknown Date';

          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Airline Icon
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.airplanemode_active, size: 30),
                  ),
                  const SizedBox(width: 15),

                  // Flight Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          airlineName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Departure: $departureAirport",
                          style: const TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Date: ${formattedDate.split('\n').first}",
                          style: const TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),


                  // Status / Time
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: Colors.green,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        formattedDate.split('\n').last, // Show only time
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
