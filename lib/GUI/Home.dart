import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selectedClass = "Economy";
  final List<String> _travelClasses = ["Economy", "Business", "First Class"];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff7E9DCB),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 55),
            child: Center(
              child: Text("Select your Flight", style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('lib/Assets/Group1.png'),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('lib/Assets/Line.png', fit: BoxFit.fill),
                      Transform.translate(
                          offset: const Offset(0, 15),
                          child: Image.asset('lib/Assets/Vector.png')),
                    ],
                  ),
                ),
                Image.asset('lib/Assets/Group2.png'),
              ],
            ),
          ),

          SizedBox(height: screenHeight *0.02,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight * 0.06,
                width: screenWidth *0.45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
              SizedBox(width: screenWidth * 0.06,),
              Container(
                height: screenHeight * 0.06,
                width: screenWidth *0.45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight *0.03,),

          // Updated Dropdown Section with reduced spacing
          Container(
            height: screenHeight * 0.06,
            width: screenWidth * 0.6,
            decoration: BoxDecoration(
              color: const Color(0xff2B7DBF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton<String>(
              value: _selectedClass,
              dropdownColor: const Color(0xff2B7DBF),
              underline: Container(),
              isExpanded: true,
              icon: Container(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              items: _travelClasses.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 13), // Reduced left padding
                        child: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          size: 28,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30), // Added right padding to balance the text
                          child: Text(
                            value,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedClass = newValue!;
                });
              },
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          Expanded(child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              itemCount: 10,
              itemBuilder: (context, index){
                return Padding(padding: EdgeInsets.only(bottom: 16),
                
                  child: Image.asset("lib/Assets/Subtract.png",
                  width: double.infinity,fit: BoxFit.fitWidth
                  ),

                );
                    
            
          }))
        ],
      ),
    );
  }
}