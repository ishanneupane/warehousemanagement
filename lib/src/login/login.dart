import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehousemanagement/src/login/login_api.dart';
import '../homepage/dashboard.dart';
import '../registration/register_ui.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController(text: "abc@gmail.com");

  TextEditingController password = TextEditingController(text: "aa");

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    ApiOfUsers().fetchUsers();
    print(ApiOfUsers().fetchUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.black87,
            Colors.blue.shade900,
          ],
        )),
        child: Form(
          key: formKey,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue.shade200),
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.height * .6,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(Icons.factory_rounded,
                      color: Color(0xFF2E2E46),
                      size: MediaQuery.of(context).size.height * .2),
                  Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * .049,
                          color: CupertinoColors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.height * .5,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: email,
                      validator: (ea) {
                        if (ea != null &&
                            !RegExp(r'^[\w.-]+@([\w-]+\.\w)').hasMatch(ea)) {
                          return 'Email is not valid';
                        }
                        {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white38,
                        hintText: "abc@gmail.com",
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.height * .5,
                    child: TextFormField(
                      controller: password,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        }
                      },
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        fillColor: Colors.white38,
                        hintText: "**********",
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade900),
                    ),
                    onPressed: () {
                      // Validate the form
                      if (formKey.currentState!.validate()) {
                        // Form is valid, proceed with login
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Dashboard(), // Assuming Dashboard is the name of your dashboard screen class
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationScreen(),
                              ));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.black,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
