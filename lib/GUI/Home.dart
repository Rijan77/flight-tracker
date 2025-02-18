import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selectedClass = "Economy";
  final List<String> _travelClasses = ["Economy", "Business", "First Class"];

  int _selectedPeople = 1;
  final List<int> _numPeople = [1, 2, 3, 4];


  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff7E9DCB),
      appBar: AppBar(
        backgroundColor: const Color(0xff7E9DCB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp, color: Colors.black, size: 35,),
          onPressed: () {
            Navigator.pop(context); // Navigate to the previous screen
          },
        ),

        title: const Text(
          "Select your Flight",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.only(top: 55),
          //   child: Center(
          //     child: Text(
          //       "Select your Flight",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 25,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(top: 7, left: 10, right: 10),
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
                        child: Image.asset('lib/Assets/Vector.png'),
                      ),
                    ],
                  ),
                ),
                Image.asset('lib/Assets/Group2.png'),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Colors.black54
                      )
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12, right: 15),
                        child: Icon(
                          Icons.calendar_month_outlined,
                          size: 29,
                        ),
                      ),
                      Text(
                        "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.06),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      children: _numPeople.map((num) {
                        return SimpleDialogOption(
                          onPressed: () {
                            setState(() {
                              _selectedPeople = num;
                            });
                            Navigator.pop(context);
                          },
                          child: Text("$num passenger"),
                        );
                      }).toList(),
                    ),
                  );
                },
                child: Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black54
                    )
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12, right: 15),
                        child: Icon(
                          Icons.people_alt_rounded,
                          size: 28,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "$_selectedPeople passenger",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.026),
          Container(
            height: screenHeight * 0.06,
            width: screenWidth * 0.6,
            decoration: BoxDecoration(
              color: const Color(0xff2B7DBF),
              borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: Colors.black54,
                  width: 1.2
                )
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
              items: _travelClasses
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          size: 28,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30),
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              itemCount: 20 ,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Stack(
                    children: [
                      Image.asset(
                        "lib/Assets/Subtract.png",
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 30),
                            child: Row(
                              children: [
                                const Text("7:05 AM", style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19
                                ),),
                                SizedBox(width: screenWidth * 0.17,),
                                Image.asset("lib/Assets/Vector1.png"),
                                SizedBox(width: screenWidth * 0.17,),
                                const Text("8:05 PM", style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19
                                ),)
                                
                              ],

                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 45),
                                child: Text("USA", style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16
                                ),),
                              ),
                              SizedBox(width: screenWidth * 0.21,),
                              const Text("13:00", style: TextStyle(
                                fontSize: 16
                              ),),
                              SizedBox(width: screenWidth * 0.2,),
                              const Text("ETH", style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16
                              ),)
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                            indent: 15,
                            endIndent: 15,
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Text("Air Canada", style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                ),),
                              ),
                              SizedBox(width: screenWidth * 0.4,),
                              const Text("\$ 10000", style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
