import 'package:flutter/material.dart';

class Ram extends StatelessWidget {
  const Ram({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            board(
                .4,
                .22,
                ["Today's Order:", "21122  \n , ", "", "", "Revenue:"],
                context),
            board(
                .4,
                .52,
                [
                  "This Month Order",
                  "This Month Revenue",
                ],
                context),
            board(.4, .227, ["Text5", "Text6"], context),
          ],
        ),
        Expanded(
          child: Row(
            children: [
              board(.9, .22, ["Text1", "Text2"], context),
              board(.9, .52, ["Text3", "Text4"], context),
              board(.9, .227, ["Text5", "Text6"], context),
            ],
          ),
        ),
      ],
    );
    ;
  }
}

Widget board(double H, double W, List<String> texts, BuildContext context) {
  return Container(
    margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
    height: MediaQuery.of(context).size.height * H,
    width: MediaQuery.of(context).size.width * W,
    color: Color(0xCA0D0D41),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: texts.map((text) {
        return Column(
          children: [
            Text(
              textAlign: TextAlign.left,
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        );
      }).toList(),
    ),
  );
}
