import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
     final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body:
      Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("lib/Assets/ForgotPassword2.png", fit: BoxFit.cover,),

          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  // padding: const EdgeInsets.only(top: 520),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 540),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.email_outlined, size: 30),
                                SizedBox(
                                  height: 32,
                                  child: VerticalDivider(
                                    color: Colors.black54,
                                    thickness: 1.5,
                                    width: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          labelText: "Email",
                        hintText: "@gmail.com",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 1.7, color: Colors.grey, )

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.black87, width: 2),
                        )

                      ),

                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.08,)
            ,
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30) )
                  ),
                  child: Center(
                    child:
                    FractionallySizedBox(
                      widthFactor: 0.7,
                      heightFactor: 0.34,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black54, width: 1.5),
                        ),
                        child: Center(child: Text("SUBMIT", style: TextStyle(
                          fontSize: screenHeight * 0.025,
                          fontWeight: FontWeight.w600,),)),
                      ),
                    ),
                  ),

                )
              ],

            ),
          )
        ],
      ),
    );
  }
}
