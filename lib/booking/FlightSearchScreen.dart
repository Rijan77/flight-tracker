import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'flight_selection_screen.dart'; // Make sure this file exists

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  _FlightSearchScreenState createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  String tripType = "One Way";
  String? from;
  String? to;
  DateTime selectedDate = DateTime.now();
  DateTime selectedReturnDate = DateTime.now();
  int passengers = 1;

  final List<String> airports = [
    "Kathmandu",
    "Pokhara",
    "Bhairahwa",
    "Dhangadi",
    "Biratnagar",
    "Nepalgunj",
    "Janakpur"
  ];

  final List<int> passengerOptions = List.generate(5, (index) => index + 1);

  String getFormattedDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  void _selectDate(BuildContext context, {required bool isReturn}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isReturn ? selectedReturnDate : selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        if (isReturn) {
          selectedReturnDate = picked;
        } else {
          selectedDate = picked;
        }
      });
    }
  }

  void searchFlights() {
    if (from == null || to == null || from == to) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select valid departure and destination')),
      );
      return;
    }

    // Navigate to FlightSelectionScreen after successful validation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlightSelectionScreen(
          from: from!,
          to: to!,
          departureDate: getFormattedDate(selectedDate),
          returnDate: tripType == "Round Trip" ? getFormattedDate(selectedReturnDate) : null,
          passengers: passengers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Flights'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Trip Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              Row(
                children: [
                  ChoiceChip(
                    label: Text("One Way"),
                    selected: tripType == "One Way",
                    onSelected: (selected) {
                      setState(() {
                        tripType = "One Way";
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  ChoiceChip(
                    label: Text("Round Trip"),
                    selected: tripType == "Round Trip",
                    onSelected: (selected) {
                      setState(() {
                        tripType = "Round Trip";
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "From",
                  border: OutlineInputBorder(),
                ),
                items: airports.map((place) => DropdownMenuItem(value: place, child: Text(place))).toList(),
                onChanged: (value) => setState(() => from = value),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "To",
                  border: OutlineInputBorder(),
                ),
                items: airports.map((place) => DropdownMenuItem(value: place, child: Text(place))).toList(),
                onChanged: (value) => setState(() => to = value),
              ),
              SizedBox(height: 20),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Departure Date",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                controller: TextEditingController(text: getFormattedDate(selectedDate)),
                onTap: () => _selectDate(context, isReturn: false),
              ),
              SizedBox(height: 20),
              if (tripType == "Round Trip")
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Return Date",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  controller: TextEditingController(text: getFormattedDate(selectedReturnDate)),
                  onTap: () => _selectDate(context, isReturn: true),
                ),
              SizedBox(height: 20),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(
                  labelText: "Number of Passengers",
                  border: OutlineInputBorder(),
                ),
                value: passengers,
                items: passengerOptions.map((count) {
                  return DropdownMenuItem<int>(value: count, child: Text(count.toString()));
                }).toList(),
                onChanged: (count) => setState(() => passengers = count!),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: searchFlights,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Search Flights'),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}