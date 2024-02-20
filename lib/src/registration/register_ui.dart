import 'package:flutter/material.dart';

import '../login/login.dart';

class RegistrationScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey,
              Colors.blue.shade900
            ], // You can adjust these colors as needed
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .35,
            height: MediaQuery.of(context).size.height * .75,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    SizedBox(height: 20),
                    Text(
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
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    SizedBox(height: 20),
                    Text(
                      "Email Address",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    TextFormField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
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
                            !RegExp(r'^[\w.-]+@([\w-]+\.\w+)$').hasMatch(ea)) {
                          return 'Email is not valid.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
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
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade300),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                            // Submit your registration data
                          }
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red.shade300),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
    );
  }
}
