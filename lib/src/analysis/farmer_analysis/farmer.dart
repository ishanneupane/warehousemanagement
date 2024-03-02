import 'package:flutter/material.dart';

class Assets {
  static const String aImage = "assets/image/a.png";
  static const String bImage = "assets/image/b.png";
  static const String cImage = "assets/image/c.png";
  static const String dImage = "assets/image/d.png";
  static const String demandImage = "assets/image/demand.png";
  static const String eImage = "assets/image/e.png";
  static const String fImage = "assets/image/f.png";
  static const String gImage = "assets/image/g.png";
  static const String hImage = "assets/image/h.png";
  static const String iImage = "assets/image/i.png";
  static const String icLauncherImage = "assets/image/ic_launcher.png";
  static const String jImage = "assets/image/j.png";
  static const String kImage = "assets/image/k.png";
  static const String khaiImage = "assets/image/khai.png";
  static const String lImage = "assets/image/l.png";
  static const String mImage = "assets/image/m.png";
  static const String nImage = "assets/image/n.png";
  static const String oImage = "assets/image/o.png";
  static const String pImage = "assets/image/p.png";
  static const String totImage = "assets/image/tot.png";
}

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
      appBar: AppBar(title: Text("Farmer's Detail")),
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
