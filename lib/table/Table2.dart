import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warehousemanagement/core/widget/custom_text.dart';

class CustomTable2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
            "Top 10 Products with Highest Price Fluctuation (Min. 5 years of sale not more than three missing)"),
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              child: DataTable(
                // border: TableBorder.all(color: Colors.black),
                dividerThickness: 02,
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                columns: [
                  DataColumn(label: Text('Product')),
                  DataColumn(label: Text('2013')),
                  DataColumn(label: Text('2014')),
                  DataColumn(label: Text('2015')),
                  DataColumn(label: Text('2016')),
                  DataColumn(label: Text('2017')),
                  DataColumn(label: Text('2018')),
                  DataColumn(label: Text('2019')),
                  DataColumn(label: Text('2020')),
                  DataColumn(label: Text('2021')),
                ],
                rows: [
                  buildDataRow("lime", [
                    "405.4",
                    "463.5",
                    "496.4",
                    "450.3",
                    "552.7",
                    "332.9",
                    "221.6",
                    "134.4",
                    "189.1"
                  ]),
                  buildDataRow("apple", [
                    "116.9",
                    "137.7",
                    "112.3",
                    "112.1",
                    "109.3",
                    "105.6",
                    "173.5",
                    "205.5",
                    "246.6"
                  ]),
                  buildDataRow("raddish red", [
                    "38.2",
                    "33.7",
                    "33.0",
                    "34.0",
                    "28.6",
                    "30.0",
                    "25.0",
                    "50.2",
                    "59.6"
                  ]),
                  buildDataRow("grapes", [
                    "238.5",
                    "151.0",
                    "150.3",
                    "124.5",
                    "127.1",
                    "157.6",
                    "127.0",
                    "204.7",
                    "216.7"
                  ]),
                  buildDataRow("potato white", [
                    "27.1",
                    "30.7",
                    "20.2",
                    "29.6",
                    "23.8",
                    "33.5",
                    "31.9",
                    "45.1",
                    "23.4"
                  ]),
                  buildDataRow("potato red", [
                    "31.8",
                    "36.0",
                    "26.6",
                    "35.5",
                    "28.3",
                    "39.5",
                    "38.1",
                    "56.9",
                    "32.2"
                  ]),
                  buildDataRow("jack fruit", [
                    "37.6",
                    "51.1",
                    "46.1",
                    "46.9",
                    "46.0",
                    "67.5",
                    "56.3",
                    "60.2",
                    "81.9"
                  ]),
                  buildDataRow("broccoli", [
                    "97.6",
                    "97.4",
                    "50.6",
                    "56.5",
                    "59.9",
                    "62.5",
                    "75.4",
                    "65.1",
                    "67.3"
                  ]),
                  buildDataRow("tomato big", [
                    "55.4",
                    "38.4",
                    "48.4",
                    "49.3",
                    "50.6",
                    "43.0",
                    "68.5",
                    "67.4",
                    "52.9"
                  ]),
                  buildDataRow("brinjal long", [
                    "35.0",
                    "27.8",
                    "34.2",
                    "41.3",
                    "38.2",
                    "42.9",
                    "48.7",
                    "51.1",
                    "45.9"
                  ]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  DataRow buildDataRow(String product, List<String> prices) {
    return DataRow(
      cells: [
        DataCell(button(product)),
        ...prices.map((price) => DataCell(button(price))),
      ],
    );
  }

  Widget button(String buttonText) {
    double price = double.tryParse(buttonText) ?? 0.0;

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
          padding: const EdgeInsets.all(8.0),
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
