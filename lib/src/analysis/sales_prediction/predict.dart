import 'package:flutter/material.dart';

import '../../../core/model/asset_img.dart';
import '../../../core/widget/custom_text.dart';
import 'apple.dart';
import 'carrot.dart';

class PredictorUi extends StatefulWidget {
  const PredictorUi({Key? key}) : super(key: key);

  @override
  _PredictorUiState createState() => _PredictorUiState();
}

class _PredictorUiState extends State<PredictorUi> {
  TextEditingController farmerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(child: Text("PREDICTION MODEL"))),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CustomText(
                      " Which product do you Want to see?",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextFormField(
                  controller: farmerController,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    icon: Icon(Icons.person),
                    hintText: 'Tomato',
                    labelText: "Product's Name",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (farmerController.text.toLowerCase() == 'apple') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AppleUi(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarrotUi(),
                        ),
                      );
                    }
                  },
                  child: Text("View Trends"),
                )
              ],
            ),
          ),

          Expanded(child: Image.asset(Assets.image5)),
          Center(
            child: CustomText(
              " Trend of Total Sales till 2021 + Prediction for 2022",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Divider(),
          // Image.asset(Assets.image1),
          // Divider(),
          // Image.asset(Assets.image2),
          // Divider(),
          // Image.asset(Assets.image6),
          // Divider(),
          // Image.asset(Assets.image7),
          // Divider(),
          // Image.asset(Assets.image8),
          // Divider(),
          // Image.asset(Assets.image3),
          // Divider(),
          // Image.asset(Assets.image4),
          // Divider(),
        ],
      ),
    );
  }
}
