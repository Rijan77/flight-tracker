import 'package:flight_app/GUI/CustomDialog.dart';
import 'package:flight_app/GUI/user_auth/Login_Page.dart';
import 'package:flutter/material.dart';

import 'Auth_Service.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {

  final _auth = AuthService();
  final _email = TextEditingController();

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
                      controller: _email,
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
                          borderSide: const BorderSide(width: 1.7, color: Colors.grey, )

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
                InkWell(
                  onTap: () async{
                    String email = _email.text.trim();

                    if(email.isEmpty){
                      CustomDialog.showSnackBar(context: context, message: "Please enter your valid email address.");
                    }else{
                      try{
                        await _auth.sendPasswordResetLink(email);
                        CustomDialog.showSuccessDialog(
                            context: context,
                            title: "Sucess",
                            message: "A password reset link has been sent to $email",
                            onConfirm: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                            }
                            );
                      }catch (error){
                        CustomDialog.showSnackBar(context: context, message: "Failed to send the email. Please try again.");
                      }
                    }
                  },

                  child: Container(
                    width: double.infinity,
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade200,
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30) )
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
