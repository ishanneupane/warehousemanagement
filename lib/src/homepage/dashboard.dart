import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:warehousemanagement/src/inventory/status_of_inventory/status_sql.dart';
import 'package:warehousemanagement/src/orders/order_initial_ui.dart';
import '../../core/widget/alert.dart';
import '../../core/widget/custom_text.dart';
import '../../core/widget/piechart.dart';
import '../../main.dart';
import '../analysis/analysis_initial_ui.dart';
import '../inventory/inventory_initial_ui.dart';
import 'package:provider/provider.dart';

import '../inventory/status_of_inventory/provider.dart';
import '../login/login.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    bool hasLowInventory = false;
    List<Color> colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.yellow,
      Colors.pink,
      Colors.cyan,
      Colors.indigo,
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ));
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
        title: Center(
          child: CustomText(
            "DashBoard",
            color: Colors.white70,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          children: [
            Center(
                child: CustomText(
              "MENU",
              color: Colors.green.shade900,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InventoryInitialUi(),
                    ));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueGrey),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.inventory_sharp,
                      size: 40,
                    ),
                    CustomText("Inventory",
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnalysisInitialUi(),
                    ));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueGrey),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.analytics_outlined,
                      size: 40,
                    ),
                    CustomText("Analysis",
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderInitialUi(),
                    ));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueGrey),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: Colors.redAccent,
                      size: 40,
                    ),
                    CustomText("Orders",
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
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
                    color: Colors.red.shade300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.logout_sharp,
                      size: 40,
                    ),
                    CustomText("Log Out",
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Consumer<WeightDifferenceNotifier>(
        builder: (context, state, _) {
          hasLowInventory = state.weightDifferences.values.any(
              (weightDifference) =>
                  weightDifference != null && weightDifference < 10);

          if (hasLowInventory) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) => LowInventoryAlert(),
              );
            });
          }

          return FutureBuilder<Map<String, double>>(
              future: InventoryCalculator.calculateWeightDifference(
                currentInventoryDatabase!,
                salesInventoryDatabase!,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final weightDifferences = snapshot.data ?? {};
                  state.setWeightDifferences(weightDifferences);

                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .4,
                              // width: MediaQuery.of(context).size.width * .22,
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01),
                              color: Color(0xCA0D0D41),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText("Today",
                                        color: Colors.white, fontSize: 16),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    CustomText("469",
                                        color: Colors.white, fontSize: 18),
                                    CustomText("orders",
                                        color: Colors.white, fontSize: 14),
                                    Row(
                                      children: [
                                        CustomText("35 ",
                                            color: Colors.green, fontSize: 15),
                                        CustomText("vs yesterday",
                                            color: Colors.white, fontSize: 12),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    CustomText("469000",
                                        color: Colors.white, fontSize: 18),
                                    CustomText("Revenue",
                                        color: Colors.white, fontSize: 14),
                                    Row(
                                      children: [
                                        CustomText("90000 ",
                                            color: Colors.green, fontSize: 15),
                                        CustomText("vs yesterday",
                                            color: Colors.white, fontSize: 12),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height * .4,
                              // width: MediaQuery.of(context).size.width * .52,
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01),
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
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01),
                              color: Color(0xCA0D0D41),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomText("Processing",
                                        color: Colors.white, fontSize: 16),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    CustomText("469",
                                        color: Colors.redAccent, fontSize: 18),
                                    CustomText("Unfulfilled Orders",
                                        color: Colors.white, fontSize: 14),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                    ),
                                    CustomText("3",
                                        color: Colors.white, fontSize: 18),
                                    CustomText("Delivery Trucks Dispatched",
                                        color: Colors.white, fontSize: 14),
                                    CustomText("0",
                                        color: Colors.white, fontSize: 30),
                                    CustomText("Incoming Deliveries",
                                        color: Colors.white, fontSize: 14),
                                  ],
                                ),
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
                              // width: MediaQuery.of(context).size.width * .22,
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01),
                              color: Color(0xCA0D0D41),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText("This Month",
                                      color: Colors.white, fontSize: 16),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  CustomText("2000",
                                      color: Colors.white, fontSize: 18),
                                  CustomText("orders",
                                      color: Colors.white, fontSize: 14),
                                  Row(
                                    children: [
                                      CustomText("95 ",
                                          color: Colors.green, fontSize: 15),
                                      CustomText("vs previous month",
                                          color: Colors.white, fontSize: 12),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                  CustomText("6544000",
                                      color: Colors.white, fontSize: 18),
                                  CustomText("Revenue",
                                      color: Colors.white, fontSize: 14),
                                  Row(
                                    children: [
                                      CustomText("90000 ",
                                          color: Colors.green, fontSize: 15),
                                      CustomText("vs last month",
                                          color: Colors.white, fontSize: 12),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                  ),
                                  CustomText("Product of the Month: ",
                                      color: Colors.white, fontSize: 20),
                                  Row(
                                    children: [
                                      CustomText("Potato ",
                                          color: CupertinoColors.activeBlue,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                      Icon(
                                        ZondIcons.trophy,
                                        color: Colors.yellow,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                // height: MediaQuery.of(context).size.height * .9,
                                // width: MediaQuery.of(context).size.width * .52,
                                margin: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.01),
                                color: Color(0xCA0D0D41),
                                child: Image.asset("assets/image/khai.png"),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                // height: MediaQuery.of(context).size.height * .9,
                                // width: MediaQuery.of(context).size.width * .227,
                                margin: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.01),
                                color: Color(0xCA0D0D41),
                                child: PieChartMaker(
                                  sections: state.weightDifferences.entries
                                      .map((entry) {
                                    final productName = entry.key;
                                    final weightDifference = entry.value ?? 0.0;
                                    final index = state.weightDifferences.keys
                                        .toList()
                                        .indexOf(productName);
                                    return PieChartSectionData(
                                        value: weightDifference,
                                        color: colors[index % colors.length],
                                        title: productName,
                                        titleStyle:
                                            TextStyle(color: Colors.white));
                                  }).toList(),
                                  title: 'Remaining Inventory',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              });
        },
      ),
    );
  }
}
