// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff7E9DCB),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Login",
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 184, 204, 234),
//                 ),
//               ),
//               const SizedBox(height: 40),
//
//               // Email Input
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.lightBlue.shade50,
//                   prefixIcon: const Icon(Icons.email,
//                       color: Color.fromARGB(255, 168, 191, 226)),
//                   labelText: "Email",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Password Input
//               TextField(
//                 controller: _passwordController,
//                 obscureText: !_isPasswordVisible,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.lightBlue.shade50,
//                   prefixIcon: const Icon(Icons.lock,
//                       color: Color.fromARGB(255, 168, 191, 226)),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: Colors.lightBlue,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isPasswordVisible = !_isPasswordVisible;
//                       });
//                     },
//                   ),
//                   labelText: "Password",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//
//               // Forgot Password
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: const Text(
//                     "Forgot Password?",
//                     style: TextStyle(color: Color(0xff7E9DCB)),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Login Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 4, 71, 172),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     "Login",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Divider
//               Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       color: Colors.white.withOpacity(0.5),
//                       thickness: 1,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10),
//                     child: Text(
//                       "OR",
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       color: Colors.white.withOpacity(0.5),
//                       thickness: 1,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//
//               // Google Sign-In Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: OutlinedButton.icon(
//                   onPressed: () {
//                     // Handle Google Sign-In
//                   },
//                   icon: const FaIcon(
//                     FontAwesomeIcons.google,
//                     color: Colors.red,
//                   ),
//                   label: const Text(
//                     "Sign in with Google",
//                     style: TextStyle(fontSize: 16, color: Colors.black),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Colors.white),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     backgroundColor: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Sign Up Link
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text("Don't have an account? "),
//                   GestureDetector(
//                     onTap: () {},
//                     child: const Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         color: Color(0xff7E9DCB),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
