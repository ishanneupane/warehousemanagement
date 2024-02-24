import 'package:flutter/material.dart';
class Table extends StatelessWidget {
  const Table({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
        onTap: ()
    {}
       ,
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
