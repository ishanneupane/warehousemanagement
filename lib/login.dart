import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehousemanagement/dashboard.dart';
import 'package:warehousemanagement/register.dart';

class LoginScreen extends StatelessWidget {
  //final _formKey = GlobalKey<FormState>();
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
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade200),
            height: MediaQuery.of(context).size.height * .55,
            width: MediaQuery.of(context).size.height * .6,
            alignment: Alignment.center,
            child: Column(
              children: [
                //SizedBox(
                // height: MediaQuery.of(context).size.height * .1505,
                //  ),

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
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue.shade900)),
                  onPressed: () {
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => dashboard(),
                          ));
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
    );
  }
}
