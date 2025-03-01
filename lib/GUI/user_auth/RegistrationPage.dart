import 'package:flutter/material.dart';

import '../CustomDialog.dart';
import 'Auth_Service.dart';
import 'Login_Page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isPasswordVisible = false;

  final _name = TextEditingController();
  final _number = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/Assets/Registration2.png",
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(height: screenHeight * 0.12),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 100, left: 50),
                child: Text(
                  "Create new Account",
                  style: TextStyle(
                    fontSize: screenHeight * 0.049,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.09),
                      // Name TextField
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                        child: TextField(
                          controller: _name,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.person_outline, size: 30),
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
                            labelText: "Full Name",
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
                      // Phone Number TextField
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                        child: TextField(
                          controller: _number,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.phone_outlined, size: 30),
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
                            labelText: "Phone Number",
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
                      // Email TextField
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                        child: TextField(
                          controller: _email,
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
                      // Password TextField
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                        child: TextField(
                          controller: _password,
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
                                  Icon(Icons.lock_outline, size: 30),
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
                      SizedBox(height: screenHeight * 0.03),
                      // Sign Up Button
                      InkWell(
                        onTap: _signup,
                        child: FractionallySizedBox(
                          widthFactor: 0.75,
                          child: Container(
                            height: screenHeight * 0.065,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black54, width: 1.5),
                            ),
                            child: Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontSize: screenHeight * 0.025,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      const Text(
                        "OR",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      // Google Sign Up Button
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
                                "Sign up with Google",
                                style: TextStyle(
                                  fontSize: screenHeight * 0.02,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have Account? ",
                            style: TextStyle(
                              fontSize: screenHeight * 0.018,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                            },
                            child: Text(
                              "LOGIN",
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  _signup() async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      CustomDialog.showSnackBar(
          context: context, message: "Email and Password cannot be empty");
      return;
    }

    if (!_email.text.contains("@gmail.com")) {
      CustomDialog.showSnackBar(
          context: context, message: "Please enter a valid email address.");
      return;
    }

    if (_password.text.length < 6) {
      CustomDialog.showSnackBar(
          context: context, message: "Password must be at least 6 characters.");
      return;
    }

    try {
      final user = await _auth.createUserWithEmailAndPassword(
          _email.text, _password.text);

      if (user != null) {
        // Send email verification link
        await _auth.sendEmailVerificationLink();

        CustomDialog.showSuccessDialog(
          context: context,
          title: "Verify Your Email",
          message:
          "A verification link has been sent to your email address. Please verify your email before logging in.",
          onConfirm: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        );
      }
    } on Exception catch (e) {
      CustomDialog.showSnackBar(
          context: context,
          message: e.toString().replaceFirst('Exception: ', ''));
    }
  }
}