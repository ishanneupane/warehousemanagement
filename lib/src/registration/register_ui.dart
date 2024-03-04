import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/src/login/login.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey, Colors.blue.shade900],
              ),
            ),
            child: Center(
              child: Container(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Full Name",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        TextFormField(
                          controller: usernameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Full Name',
                            labelText: 'Name *',
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide
                                  .none, // This removes the default border
                            ),
                          ),
                          validator: (fullName) {
                            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(fullName!)) {
                              return 'Do not use random characters.';
                            } else if (fullName.length < 3) {
                              return 'Name is too short';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Location",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        TextFormField(
                          controller: locationController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.location_on),
                            labelText: 'Location Name',
                            hintText: "Surya Binayak",
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide
                                  .none, // This removes the default border
                            ),
                          ),
                          validator: (location) {
                            if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(location!)) {
                              return 'Do not use random characters.';
                            } else if (location.length < 3) {
                              return 'Location Name is too short';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Email Address",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        TextFormField(
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.email),
                            hintText: 'abc@gmail.com',
                            labelText: 'Email Address ',
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide
                                  .none, // This removes the default border
                            ),
                          ),
                          validator: (ea) {
                            if (ea != null &&
                                !RegExp(r'^[\w.-]+@([\w-]+\.\w+)$')
                                    .hasMatch(ea)) {
                              return 'Email is not valid.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Password",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.lock),
                            hintText: "**********",
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide
                                  .none, // This removes the default border
                            ),
                          ),
                          validator: (password) {
                            if (password != null && password.length < 6) {
                              return 'Password should be at least 6 characters.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 50),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.green.shade300),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                _postData();
                              }
                            },
                            child: const Text(
                              'Register',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 50),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.red.shade300),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Back',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading == true)
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.5)),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  bool _isLoading = false;

  Future<void> _postData() async {
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });

    const String apiUrl =
        'https://login-signup-agou.onrender.com/api/users'; // change with your api endpoint / baseurl

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Error while registration'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
