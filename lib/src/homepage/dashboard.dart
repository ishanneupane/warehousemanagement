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
      backgroundColor: Colors.grey.shade800,
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
            "DASHBOARD",
            color: Colors.white70,
            fontSize: 22,
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
                              flex: 4,
                              child: Container(
                                child: Column(
                                  children: [
                                    CustomText(
                                      "Hello Users!!!\nWelcome to our WareHouse System",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Icon(
                                      LineAwesome.praying_hands_solid,
                                      size: 50,
                                      color: Colors.blue.shade800,
                                    ),
                                    CustomText(
                                      "You are currently viewing:\n Product De",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: MediaQuery.of(context).size.height * .4,
                              // width: MediaQuery.of(context).size.width * .52,
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01),
                              color: Colors.white,
                              child: Image.asset(
                                "assets/image/demand.png",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: MediaQuery.of(context).size.height * .4,
                              width: MediaQuery.of(context).size.width * .52,
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01),
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
                                title: 'Inventory Composition',
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.01),
                                color: Color(0xCA0D0D41),
                                child: Image.asset("assets/image/khai.png"),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.01),
                                color: Colors.grey,
                                child: Column(
                                  children: [
                                    CustomText(
                                      "Total Inventory Remaining",
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Expanded(
                                      child: BarChart(
                                        BarChartData(
                                          alignment:
                                              BarChartAlignment.spaceAround,
                                          titlesData: FlTitlesData(
                                            bottomTitles: AxisTitles(
                                              // axisNameSize: double.infinity,
                                              sideTitles: SideTitles(
                                                showTitles: true,
                                                getTitlesWidget: (value, _) {
                                                  final color = Colors.white;
                                                  return Text(
                                                    value.toString(),
                                                    style:
                                                        TextStyle(color: color),
                                                  );
                                                },
                                              ),
                                            ),
                                            leftTitles: AxisTitles(
                                              drawBelowEverything: true,
                                              sideTitles: SideTitles(
                                                  // showTitles: true,
                                                  reservedSize: 40),
                                            ),
                                          ),
                                          barGroups: List.generate(
                                            state.weightDifferences.length,
                                            (index) {
                                              final productName = state
                                                  .weightDifferences.keys
                                                  .toList()[index];
                                              final weightDifference =
                                                  state.weightDifferences[
                                                          productName] ??
                                                      0.0;
                                              return BarChartGroupData(
                                                x: index,
                                                barRods: [
                                                  BarChartRodData(
                                                    toY: weightDifference,
                                                    color: colors[
                                                        index % colors.length],
                                                    width: 30,
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                          borderData: FlBorderData(
                                            show: true,
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                          ),
                                          barTouchData: BarTouchData(
                                            touchTooltipData:
                                                BarTouchTooltipData(
                                              tooltipBgColor: Colors.grey,
                                              getTooltipItem: (group,
                                                  groupIndex, rod, rodIndex) {
                                                final productName = state
                                                    .weightDifferences.keys
                                                    .toList()[group.x.toInt()];
                                                final weightDifference =
                                                    rod.toY;
                                                return BarTooltipItem(
                                                  '$productName\n ' +
                                                      'Weight(KG)' +
                                                      '$weightDifference',
                                                  TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
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
