import 'package:flutter/material.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';

class PassengerContactFormScreen extends StatefulWidget {
  const PassengerContactFormScreen({super.key});

  @override
  _PassengerContactFormScreenState createState() =>
      _PassengerContactFormScreenState();
}

class _PassengerContactFormScreenState
    extends State<PassengerContactFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String phone = '';
  String email = '';
  List<String> additionalPassengerNames = [];
  TextEditingController additionalNameController = TextEditingController();

  // Function to handle form submission
  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, perform the desired action
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Booking Confirmed'),
          content: Text('Your flight has been booked successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    }
  }

  // Function to add additional passenger
  void addAdditionalPassenger() {
    if (additionalNameController.text.isNotEmpty) {
      setState(() {
        additionalPassengerNames.add(additionalNameController.text);
        additionalNameController.clear();
      });
    }
  }

  esewapaymentcall() {
    try {
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          environment: Environment.test,
          clientId: StaticValue.CLIENT_ID,
          secretId: StaticValue.SECRET_KEY,
        ),
        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "20",
          callbackUrl: '',
        ),
        onPaymentSuccess: (EsewaPaymentSuccessResult data) {
          debugPrint(":::SUCCESS::: => $data");
          // verifyTransactionStatus(data);
        },
        onPaymentFailure: (data) {
          debugPrint(":::FAILURE::: => $data");
        },
        onPaymentCancellation: (data) {
          debugPrint(":::CANCELLATION::: => $data");
        },
      );
    } on Exception catch (e) {
      debugPrint("EXCEPTION : ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7E9DCB),
      appBar: AppBar(
        title: Text('Passenger Contact', style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400
        ),),
        backgroundColor: Color(0xff7E9DCB),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 70),
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [Colors.blue.shade100, Colors.blue.shade600],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Instruction Text
            // Text(
            //   'The airline will contact you using the following information for any updates or queries regarding your flight.',
            //   style: TextStyle(color: Colors.black, fontSize: 16),
            // ),
            // SizedBox(height: 20),

            // Form to collect the passenger's contact information inside a Container
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.only(top: 60, left: 16.0, right: 16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Full Name (Required)
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() => fullName = value),
                        ),
                        SizedBox(height: 20), // Increased space

                        // Phone Number (Required - 10 digits)
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (value.length != 10) {
                              return 'Phone number must be 10 digits';
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() => phone = value),
                        ),
                        SizedBox(height: 20), // Increased space

                        // Email Address (Required)
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zAA-Z0-9.-]+$')
                                .hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() => email = value),
                        ),
                        SizedBox(height: 20), // Increased space

                        // Additional Passenger Name Field (Optional)
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: additionalNameController,
                                decoration: InputDecoration(
                                  labelText: 'Add Passenger Name (Optional)',
                                  labelStyle: TextStyle(color: Colors.black),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: addAdditionalPassenger,
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                        SizedBox(height: 20), // Increased space

                        // List of Additional Passenger Names
                        if (additionalPassengerNames.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: additionalPassengerNames.map((name) {
                              return ListTile(
                                title: Text(name),
                                trailing: Icon(Icons.delete),
                                onTap: () {
                                  setState(() {
                                    additionalPassengerNames
                                        .remove(name);
                                  });
                                },
                              );
                            }).toList(),
                          ),

                        SizedBox(height: 40), // Reduced space between button and form

                        // Submit Button
                        Center(
                          child: ElevatedButton(
                            onPressed: esewapaymentcall,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange.shade400, // Use primary for button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                            ),
                            child: Text('Proceed to Payment', style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5), // Final decrease in space at the bottom
          ],
        ),
      ),
    );
  }
}


class StaticValue {
  static var CLIENT_ID = "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R";
  static var SECRET_KEY = "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==";
}
