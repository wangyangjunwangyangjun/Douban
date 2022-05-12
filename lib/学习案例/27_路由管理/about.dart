import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYAboutPage extends StatelessWidget {
  static const String routerName = "/about";
  @override
  Widget build(BuildContext context) {
    final String message = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("关于页面"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(message),
            RaisedButton(
              child: Text("返回首页"),
                onPressed: () {
                  Navigator.of(context).pop();
            })
          ],
        ),
      ),
    );
  }
}
