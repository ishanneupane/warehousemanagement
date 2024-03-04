import 'package:flutter/material.dart';
import 'package:warehousemanagement/table/Table2.dart';

class CustomTable1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text("FLUCTUATIONS")),
      ),
      body: ListView(
        children: [
          buildDataTable(
              " 1) Top 10 Products with Highest Price Fluctuation (Min. 5 years of sales with at least one missing)",
              [
                {
                  "Product": "Mango",
                  "Autumn": "180.0",
                  "Spring": "120.0",
                  "Summer": "90.0",
                  "Winter": "0.0"
                },
                {
                  "Product": "Jack Fruit",
                  "Autumn": "30.0",
                  "Spring": "60.0",
                  "Summer": "30.0",
                  "Winter": "80.0"
                },
                {
                  "Product": "Carrot",
                  "Autumn": "100.0",
                  "Spring": "35.5",
                  "Summer": "70.0",
                  "Winter": "50.0"
                },
                {
                  "Product": "Grapes",
                  "Autumn": "300.0",
                  "Spring": "30.0",
                  "Summer": "170.0",
                  "Winter": "150.0"
                },
                {
                  "Product": "Broccoli",
                  "Autumn": "100.0",
                  "Spring": "60.0",
                  "Summer": "110.0",
                  "Winter": "45.0"
                },
                {
                  "Product": "Okra",
                  "Autumn": "70.0",
                  "Spring": "70.0",
                  "Summer": "40.0",
                  "Winter": "100.0"
                },
                {
                  "Product": "Tomato Small",
                  "Autumn": "50.0",
                  "Spring": "35.5",
                  "Summer": "45.0",
                  "Winter": "30.0"
                },
                {
                  "Product": "Potato Red",
                  "Autumn": "46.0",
                  "Spring": "28.0",
                  "Summer": "37.0",
                  "Winter": "31.0"
                },
                {
                  "Product": "Potato White",
                  "Autumn": "35.0",
                  "Spring": "22.0",
                  "Summer": "30.0",
                  "Winter": "23.0"
                },
                {
                  "Product": "Radish Red",
                  "Autumn": "45.0",
                  "Spring": "35.0",
                  "Summer": "40.0",
                  "Winter": "30.0"
                },
              ],
              0),
          Divider(),
          buildDataTable(
              "2) Top 10 Products with Lowest Price Fluctuation (Min. 5 years of sale at least one missing)",
              [
                {
                  "Product": "Lime",
                  "Autumn": "400.0",
                  "Spring": "400.0",
                  "Summer": "400.0",
                  "Winter": "400.0"
                },
                {
                  "Product": "Apple",
                  "Autumn": "120.0",
                  "Spring": "120.0",
                  "Summer": "120.0",
                  "Winter": "110.0"
                },
                {
                  "Product": "Brinjal Long",
                  "Autumn": "40.0",
                  "Spring": "40.0",
                  "Summer": "35.5",
                  "Winter": "40.0"
                },
                {
                  "Product": "Papaya",
                  "Autumn": "80.0",
                  "Spring": "60.0",
                  "Summer": "75.0",
                  "Winter": "75.0"
                },
                {
                  "Product": "Tomato Big",
                  "Autumn": "55.0",
                  "Spring": "40.0",
                  "Summer": "55.0",
                  "Winter": "45.0"
                },
                {
                  "Product": "Reddish Red",
                  "Autumn": "45.0",
                  "Spring": "35.0",
                  "Summer": "40.0",
                  "Winter": "30.0"
                },
                {
                  "Product": "Tomato Small",
                  "Autumn": "50.0",
                  "Spring": "35.5",
                  "Summer": "45.0",
                  "Winter": "30.0"
                },
                {
                  "Product": "Potato White",
                  "Autumn": "35.0",
                  "Spring": "22.0",
                  "Summer": "30.0",
                  "Winter": "23.0"
                },
                {
                  "Product": "Potato Red",
                  "Autumn": "46.0",
                  "Spring": "28.0",
                  "Summer": "37.0",
                  "Winter": "31.0"
                },
                {
                  "Product": "Tomato Small",
                  "Autumn": "50.0",
                  "Spring": "35.0",
                  "Summer": "45.0",
                  "Winter": "30.0"
                },
              ],
              1),
          Divider(),
          buildDataTable(
              "3) Top 10 Products with Lowest Price Fluctuation Consistently Available in Market",
              [
                {
                  "Product": "Lime",
                  "Autumn": "400.0",
                  "Spring": "400.0",
                  "Summer": "400.0",
                  "Winter": "400.0"
                },
                {
                  "Product": "Apple",
                  "Autumn": "120.0",
                  "Spring": "120.0",
                  "Summer": "120.0",
                  "Winter": "110.0"
                },
                {
                  "Product": "Brinjal Long",
                  "Autumn": "40.0",
                  "Spring": "40.0",
                  "Summer": "35.5",
                  "Winter": "40.0"
                },
                {
                  "Product": "Papaya",
                  "Autumn": "80.0",
                  "Spring": "60.0",
                  "Summer": "75.0",
                  "Winter": "75.0"
                },
                {
                  "Product": "Tomato Big",
                  "Autumn": "55.0",
                  "Spring": "40.0",
                  "Summer": "55.0",
                  "Winter": "45.0"
                },
                {
                  "Product": "Reddish Red",
                  "Autumn": "45.0",
                  "Spring": "35.0",
                  "Summer": "40.0",
                  "Winter": "30.0"
                },
                {
                  "Product": "Tomato Small",
                  "Autumn": "50.0",
                  "Spring": "35.5",
                  "Summer": "45.0",
                  "Winter": "30.0"
                },
                {
                  "Product": "Potato White",
                  "Autumn": "35.0",
                  "Spring": "22.0",
                  "Summer": "30.0",
                  "Winter": "23.0"
                },
                {
                  "Product": "Potato Red",
                  "Autumn": "46.0",
                  "Spring": "28.0",
                  "Summer": "37.0",
                  "Winter": "31.0"
                },
                {
                  "Product": "Tomato Small",
                  "Autumn": "50.0",
                  "Spring": "35.0",
                  "Summer": "45.0",
                  "Winter": "30.0"
                },
              ],
              2),
          Divider(),
          buildDataTable(
              "4) Top 10 Products with Highest Price Fluctuation Consistently Available in Market",
              [
                {
                  "Product": "Jack Fruit",
                  "Autumn": "30.0",
                  "Spring": "60.0",
                  "Summer": "30.0",
                  "Winter": "80.0"
                },
                {
                  "Product": "Carrot",
                  "Autumn": "100.0",
                  "Spring": "35.5",
                  "Summer": "70.0",
                  "Winter": "50.0"
                },
                {
                  "Product": "Grapes",
                  "Autumn": "300.0",
                  "Spring": "30.0",
                  "Summer": "170.0",
                  "Winter": "150.0"
                },
                {
                  "Product": "Broccoli",
                  "Autumn": "100.0",
                  "Spring": "60.0",
                  "Summer": "110.0",
                  "Winter": "45.0"
                },
                {
                  "Product": "Okra",
                  "Autumn": "70.0",
                  "Spring": "70.0",
                  "Summer": "40.0",
                  "Winter": "100.0"
                },
                {
                  "Product": "Tomato Small",
                  "Autumn": "50.0",
                  "Spring": "35.5",
                  "Summer": "45.0",
                  "Winter": "30.0"
                },
                {
                  "Product": "Potato Red",
                  "Autumn": "46.0",
                  "Spring": "28.0",
                  "Summer": "37.0",
                  "Winter": "31.0"
                },
                {
                  "Product": "Potato White",
                  "Autumn": "35.0",
                  "Spring": "22.0",
                  "Summer": "30.0",
                  "Winter": "23.0"
                },
                {
                  "Product": "Radish Red",
                  "Autumn": "45.0",
                  "Spring": "35.0",
                  "Summer": "40.0",
                  "Winter": "30.0"
                },
                {
                  "Product": "Mango",
                  "Autumn": "180.0",
                  "Spring": "120.0",
                  "Summer": "90.0",
                  "Winter": "0.0"
                },
              ],
              3),
          Divider(),
          CustomTable2()
        ],
      ),
    );
  }

  Widget buildDataTable(
      String title, List<Map<String, String>> data, int index) {
    Color backgroundColor = Colors.white;
    switch (index) {
      case 0:
        backgroundColor = Colors.brown.shade50;
        break;
      case 1:
        backgroundColor = Colors.green.shade50;
        break;
      case 2:
        backgroundColor = Colors.blue.shade50;
        break;
      case 3:
        backgroundColor = Colors.yellow.shade50;
        break;
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: backgroundColor,
            ),
            child: DataTable(
              columns: [
                DataColumn(label: Text('Product')),
                DataColumn(label: Text('Autumn')),
                DataColumn(label: Text('Spring')),
                DataColumn(label: Text('Summer')),
                DataColumn(label: Text('Winter')),
              ],
              rows: data
                  .map((item) => DataRow(
                        cells: [
                          DataCell(button(
                              item["Product"]!, double.parse(item["Autumn"]!))),
                          DataCell(button(
                              item["Autumn"]!, double.parse(item["Spring"]!))),
                          DataCell(button(
                              item["Spring"]!, double.parse(item["Summer"]!))),
                          DataCell(button(
                              item["Summer"]!, double.parse(item["Winter"]!))),
                          DataCell(button(
                              item["Winter"]!, double.parse(item["Winter"]!))),
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget button(String buttonText, double price) {
    Color backgroundColor = Colors.grey;
    if (price > 200.0) {
      backgroundColor = Colors.teal;
    } else if (price > 150.0) {
      backgroundColor = Colors.lime;
    } else if (price > 100.0) {
      backgroundColor = Colors.pink;
    } else if (price > 50.0) {
      backgroundColor = Colors.yellow;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: backgroundColor,
      ),
      margin: EdgeInsets.all(1),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blueGrey.shade900,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
