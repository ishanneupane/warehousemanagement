import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehousemanagement/src/homepage/dashboard.dart';
import 'package:warehousemanagement/src/login/login_api.dart';
import 'package:warehousemanagement/src/login/user_model/user.dart';
import '../registration/register_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<UserData> data = [];
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<UserData> users = await ApiOfUsers().fetchUsers();
    setState(() {
      data = users;
    });
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
          ),
        ),
        child: Form(
          key: formKey,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade200,
              ),
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.height * .6,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(Icons.factory_rounded,
                      color: const Color(0xFF2E2E46),
                      size: MediaQuery.of(context).size.height * .2),
                  Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * .049,
                        color: CupertinoColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * .5,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: email,
                      validator: (ea) {
                        if (ea != null &&
                            !RegExp(r'^[\w.-]+@([\w-]+\.\w)').hasMatch(ea)) {
                          return 'Email is not valid';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        fillColor: Colors.white38,
                        hintText: "abc@gmail.com",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * .5,
                    child: TextFormField(
                      controller: password,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required';
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        fillColor: Colors.white38,
                        hintText: "**********",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade900),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        bool passwordExists = false;
                        bool emailExists = false;
                        for (var user in data) {
                          if (user.name == password.text) {
                            passwordExists = true;
                          }
                          if (user.email == email.text) {
                            emailExists = true;
                          }
                          if (passwordExists && emailExists) {
                            break;
                          }
                        }

                        if (passwordExists == false && emailExists == false) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Invalid Email and Password',
                                  style: TextStyle(color: Colors.black),
                                ),
                                content: const Text(
                                  'Invalid Username & Password.',
                                  style: TextStyle(color: Colors.black),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (passwordExists == false) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Invalid Password',
                                  style: TextStyle(color: Colors.black),
                                ),
                                content: const Text(
                                  'Password is incorrect.',
                                  style: TextStyle(color: Colors.black),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (emailExists == false) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Invalid Email',
                                  style: TextStyle(color: Colors.black),
                                ),
                                content: const Text(
                                  'Email you entered is invalid. Please register.',
                                  style: TextStyle(color: Colors.black),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // Navigate to next screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(),
                            ),
                          );
                        }

                        //   final filterData = data.isNotEmpty;
                        //   if (filterData) {
                        //     Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => const HomePageScreen(),
                        //       ),
                        //     );
                        //   } else {
                        //     showDialog<void>(
                        //       context: context,
                        //       barrierDismissible: false,
                        //       builder: (BuildContext context) {
                        //         return AlertDialog(
                        //           backgroundColor: Colors.grey.shade200,
                        //           title: const CustomText("Error logging in",
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 20),
                        //           content: SingleChildScrollView(
                        //             child: ListBody(
                        //               children: const <Widget>[
                        //                 Text(
                        //                   'Invalid Email or Password \n Try Again',
                        //                   style: TextStyle(color: Colors.red),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //           actions: <Widget>[
                        //             TextButton(
                        //               child: const Text('Okay'),
                        //               onPressed: () {
                        //                 Navigator.of(context).pop();
                        //               },
                        //             ),
                        //           ],
                        //         );
                        //       },
                        //     );
                        //   }
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.black,
                            fontSize: 18,
                          ),
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
