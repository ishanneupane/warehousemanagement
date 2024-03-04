import 'package:flutter/material.dart';

import '../../../core/model/asset_img.dart';

class PredictorUi extends StatefulWidget {
  const PredictorUi({Key? key}) : super(key: key);

  @override
  _PredictorUiState createState() => _PredictorUiState();
}

class _PredictorUiState extends State<PredictorUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(child: Text("PREDICTION MODEL"))),
      body: ListView(
        children: [
          Image.asset(Assets.image1),
          Image.asset(Assets.image5),
          Image.asset(Assets.image3),
          Image.asset(Assets.image4),
          Image.asset(Assets.image2),
          Image.asset(Assets.image6),
          Image.asset(Assets.image7),
          Image.asset(Assets.image8),
        ],
      ),
    );
  }
}
