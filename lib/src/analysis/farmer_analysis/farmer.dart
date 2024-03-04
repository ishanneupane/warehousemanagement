import 'package:flutter/material.dart';
import 'package:warehousemanagement/core/widget/custom_text.dart';

import '../../../core/model/asset_img.dart';

class FarmerUi extends StatefulWidget {
  const FarmerUi({Key? key}) : super(key: key);

  @override
  _FarmerUiState createState() => _FarmerUiState();
}

class _FarmerUiState extends State<FarmerUi> {
  bool _showTotImage = false;

  void _toggleShowTotImage() {
    setState(() {
      _showTotImage = !_showTotImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: Center(
            child: CustomText(
              "Farmer's Detail",
              color: Colors.white,
              fontSize: 24,
              // fontWeight: FontWeight.bold,
            ),
          )),
      body: ListView(
        children: [
          if (!_showTotImage) ...[
            Image.asset(Assets.aImage),
            Image.asset(Assets.bImage),
            Image.asset(Assets.cImage),
            Image.asset(Assets.dImage),
            Image.asset(Assets.eImage),
            Image.asset(Assets.fImage),
            Image.asset(Assets.gImage),
            Image.asset(Assets.hImage),
            Image.asset(Assets.iImage),
            Image.asset(Assets.jImage),
            Image.asset(Assets.kImage),
            Image.asset(Assets.lImage),
            Image.asset(Assets.mImage),
            Image.asset(Assets.nImage),
            Image.asset(Assets.oImage),
            Image.asset(Assets.pImage),
          ],
          if (_showTotImage) Image.asset(Assets.totImage),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleShowTotImage,
        child: FittedBox(child: Text(_showTotImage ? "Hide" : "Show Summary")),
      ),
    );
  }
}
