import 'package:flutter/material.dart';
import 'package:warehousemanagement/core/widget/custom_text.dart';

import '../../../core/model/asset_img.dart';

class CarrotUi extends StatefulWidget {
  const CarrotUi({super.key});

  @override
  State<CarrotUi> createState() => _CarrotUiState();
}

class _CarrotUiState extends State<CarrotUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: CustomText(
            " Trends",
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
          Image.asset(Assets.c1Image),
          Divider(),
          Image.asset(Assets.c2Image),
          Divider(),
          Image.asset(Assets.c3Image),
          Divider(),
          Image.asset(Assets.c4Image),
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
