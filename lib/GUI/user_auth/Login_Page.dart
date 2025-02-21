import 'package:flight_app/GUI/user_auth/ForgotPassword.dart';
import 'package:flutter/material.dart';
import '../Home.dart';
import 'RegistrationPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/Assets/Main3.png",
            fit: BoxFit.cover,
          ),
          // Fixed Logo
          Positioned(
            top: screenHeight * 0.013, // Adjust the position as needed
            right: screenWidth * 0.66, // Adjust for proper alignment
            child: Image.asset(
              "lib/Assets/Logo-bg.png",
              width: screenWidth * 0.4,
              height: screenHeight * 0.15,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.44), // To create space for the fixed logo
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: screenHeight * 0.05,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      // Text(
                      //   "Sign in to continue.",
                      //   style: TextStyle(
                      //     fontSize: screenHeight * 0.02,
                      //     fontWeight: FontWeight.w600,
                      //     color: Colors.white,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.044),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.yellowAccent, width: 1.6),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                  child: TextField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.lock, size: 30),
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
                      labelText: "Password",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.yellowAccent, width: 1.6),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 200, top: 10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgotpassword()));
                        },
                        child: Text("Forgot Password?", style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic
                        ),),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.037),
                FractionallySizedBox(
                  widthFactor: 0.75,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                    }
                    ,
                    child: Container(
                      height: screenHeight * 0.065,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black54, width: 1.5),
                      ),
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: screenHeight * 0.025,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: screenHeight * 0.02),
                const Text(
                  "OR",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                FractionallySizedBox(
                  widthFactor: 0.75,
                  child: Container(
                    height: screenHeight * 0.065,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black54, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "lib/Assets/Google Logo.png",
                          height: screenHeight * 0.05,
                          width: screenHeight * 0.05,
                        ),
                        SizedBox(width: screenWidth * 0.02),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have Account? ",
                      style: TextStyle(
                        fontSize: screenHeight * 0.018,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegistrationPage()),
                        );
                      },
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.018,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
