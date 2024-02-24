import 'package:flutter/material.dart';

class Table extends StatelessWidget {
  const Table({super.key, required List<TableRow> children});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          button("^", Colors.blue.shade100),
          button("; )", Colors.yellowAccent),
          button("C", Colors.deepOrangeAccent),
          button("⌦", Colors.teal.shade300),
        ]),
        TableRow(children: [
          button("*", Colors.blue.shade100),
          button("1", Colors.blueGrey),
          button("2", Colors.blueGrey),
          button("3", Colors.blueGrey),
        ]),
        TableRow(children: [
          button("/", Colors.blue.shade100),
          button("4", Colors.blueGrey),
          button("5", Colors.blueGrey),
          button("6", Colors.blueGrey),
        ]),
        TableRow(children: [
          button("-", Colors.blue.shade100),
          button("7", Colors.blueGrey),
          button("8", Colors.blueGrey),
          button("9", Colors.blueGrey),
        ]),
        TableRow(children: [
          button("+", Colors.blue.shade100),
          button(".", Colors.blue.shade100),
          button("0", Colors.blueGrey),
          button("=", Colors.blue.shade700),
        ]),
      ],
    );
  }

  button(
    var buttontext,
    Color colors,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: colors,
      ),
      margin: EdgeInsets.all(4),
// height: MediaQuery.of(context).size.height * .1075,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blueGrey.shade900,
        child: Center(
          child: Text(
            buttontext,
            //    style: TextStyle(fontSize: MediaQuery.of(context).size.width * .1),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
