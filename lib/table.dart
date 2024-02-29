import 'package:flutter/material.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({super.key});

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          button("mango"),
          button("180.0", Colors.pink),
          button("120.0", Colors.lime),
          button("90.0", Colors.yellow),
          button("0.0", Colors.grey)
        ]),
        TableRow(children: [
          button("jack fruit"),
          button("30.0", Colors.grey),
          button("60.0", Colors.brown),
          button("30.0", Colors.grey),
          button("80.0", Colors.yellow)
        ]),
        TableRow(children: [
          button("carrot"),
          button("100.0", Colors.yellow),
          button("35.5", Colors.grey),
          button("70.0", Colors.brown),
          button("50.0", Colors.brown),
        ]),
        TableRow(children: [
          button("grapes"),
          button("300.0", Colors.teal),
          button("30.0", Colors.lime),
          button("170.0", Colors.pink),
          button("150.0", Colors.pink),
        ]),
        TableRow(children: [
          button("broccoli"),
          button("100.0", Colors.yellow),
          button("60.0", Colors.brown),
          button("110.0", Colors.yellow),
          button("45.0", Colors.brown),
        ]),
        TableRow(children: [
          button("okra"),
          button("70.0", Colors.brown),
          button("70.0", Colors.brown),
          button("40.0", Colors.brown),
          button("100.0", Colors.yellow),
        ]),
        TableRow(children: [
          button("tomato small"),
          button("50.0", Colors.brown),
          button("35.5", Colors.grey),
          button("45.0", Colors.brown),
          button("30.0", Colors.grey)
        ]),
        TableRow(children: [
          button("potato red "),
          button("46.0", Colors.brown),
          button("28.0", Colors.grey),
          button("37.0", Colors.grey),
          button("31.0", Colors.grey),
        ]),
        TableRow(children: [
          button("potato white"),
          button("35.0", Colors.grey),
          button("22.0", Colors.grey),
          button("30.0", Colors.grey),
          button("23.0", Colors.grey),
        ]),
        TableRow(children: [
          button("radish red"),
          button("45.0", Colors.brown),
          button("35.0", Colors.grey),
          button("40.0", Colors.brown),
          button("30.0", Colors.grey),
        ]),
        TableRow(children: [
          button("year"),
          button("Autumn"),
          button("Spring"),
          button("Summer"),
          button("Winter"),
        ]),
      ],
    );
  }

  Widget button(String buttonText, [Color? color]) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: color,
      ),
      margin: EdgeInsets.all(4),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blueGrey.shade900,
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
