import 'package:flutter/material.dart';
import 'package:warehousemanagement/login.dart';
import 'package:warehousemanagement/splash.dart';

class warehouseinfo extends StatefulWidget {
  const warehouseinfo({Key? key}) : super(key: key);

  @override
  State<warehouseinfo> createState() => _warehouseinfoState();
}

class _warehouseinfoState extends State<warehouseinfo> {
  warehouse(String address) {
    return Container(
        height: 30,
        child: Text(
          address,
          style: TextStyle(fontSize: 30),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "For Signing-Up, Please Contact Main branch office",
            style: TextStyle(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.lightGreenAccent)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ));
              },
              child: Text(
                'Done',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
