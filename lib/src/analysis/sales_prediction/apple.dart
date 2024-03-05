import 'package:flutter/material.dart';
import 'package:warehousemanagement/core/widget/custom_text.dart';

import '../../../core/model/asset_img.dart';

class AppleUi extends StatefulWidget {
  const AppleUi({super.key});

  @override
  State<AppleUi> createState() => _AppleUiState();
}

class _AppleUiState extends State<AppleUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: CustomText(
            "Apple Trends",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Image.asset(Assets.image1),
          Divider(),
          Image.asset(Assets.image2),
          Divider(),
          Image.asset(Assets.image6),
          Divider(),
          Image.asset(Assets.image7),
          Divider(),
          Image.asset(Assets.image8),
          Divider(),
          Image.asset(Assets.image3),
          Divider(),
          Image.asset(Assets.image4),
          Divider(),
        ],
      ),
    );
  }
}
