import 'package:flutter/material.dart';

import '../HomePage.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidht = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Color(0xff486C8F),

      body:
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset("lib/Assets/star.png"),

                      Image.asset("lib/Assets/airplane.png"),
                      Image.asset("lib/Assets/star.png"),
                    ],
                  ),
                  SizedBox(height: 35,),
                  Container(
                    height: screenHeight * 0.475,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFEFEF),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                    ),
                    child:
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: Text("It's a Big World Out \n There, Go Explore!",
                            style:
                            TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 180),
                          child: Image.asset("lib/Assets/Vector 3.png", scale: 0.9,),
                        ),
                        SizedBox(height: screenHeight * 0.043,),
                        Text("We can easily help you to discovering the most\n"
                            "optimal flight experience tailored to your\n"
                            "preferences and needs.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                        ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: screenHeight*0.087,),

                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()),
                            );
                          },
                          child: Container(
                            width: screenWidht * 0.86,
                            height: screenHeight* 0.072,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                              child: Text("Get Started", style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20

                              ),),
                            ),
                          ),
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),





    );
  }
}

