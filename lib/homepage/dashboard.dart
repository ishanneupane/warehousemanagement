import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:warehousemanagement/Inventory_history/inventory_history_ui.dart';
import 'package:warehousemanagement/inventory/inventory_ui.dart';
import 'package:warehousemanagement/utils/fill.dart';
import 'package:warehousemanagement/login/login.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade700,
        ),
        drawer: Drawer(
          backgroundColor: Colors.white54,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .051),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InventoryCrudAndUi(),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.logout_sharp,
                        size: 40,
                      ),
                      Text("Inventory",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InventoryHistoryUi(),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.history,
                        size: 40,
                      ),
                      Text("Inventory History",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.logout_sharp,
                        size: 40,
                      ),
                      Text("LOG OUT",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width * .22,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                  color: Color(0xCA0D0D41),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Today",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text("469",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        Text("orders",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Row(
                          children: [
                            Text("35 ",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15)),
                            Text("vs yesterday",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text("469000",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        Text("Revenue",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Row(
                          children: [
                            Text("90000 ",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15)),
                            Text("vs yesterday",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width * .52,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Image.asset(
                        "assets/image/demand.png",
                      ))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width * .227,
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                  color: Color(0xCA0D0D41),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Processing",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text("469",
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 30)),
                        Text("Unulfilled Orders",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text("3",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        Text("Delivery Trucks Dispatched",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Text("0",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        Text("Incoming Deliveries",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .9,
                    width: MediaQuery.of(context).size.width * .22,
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.01),
                    color: Color(0xCA0D0D41),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("This Month",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text("2000",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        Text("orders",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Row(
                          children: [
                            Text("95 ",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15)),
                            Text("vs previous month",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text("6544000",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                        Text("Revenue",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                        Row(
                          children: [
                            Text("90000 ",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15)),
                            Text("vs last month",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text("Product of the Month: ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Row(
                          children: [
                            Text("Potato ",
                                style: TextStyle(
                                    color: CupertinoColors.activeBlue,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                            Icon(
                              ZondIcons.trophy,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .9,
                    width: MediaQuery.of(context).size.width * .52,
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.01),
                    color: Color(0xCA0D0D41),
                    child: Image.asset("assets/image/khai.png"),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .9,
                    width: MediaQuery.of(context).size.width * .227,
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.01),
                    color: Color(0xCA0D0D41),
                    child: Column(
                      children: [PercentIndicatorDemo()],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
