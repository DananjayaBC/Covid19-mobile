import 'package:flutter/material.dart';
import 'package:covid19_mobile/widget/button_widget.dart';
import 'package:covid19_mobile/page/qr_scan_page.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Covid 19'),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            ButtonWidget(
              text: 'Scan QR Code',
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => QRScanPage(),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
