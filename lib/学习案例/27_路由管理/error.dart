import 'package:flutter/material.dart';

class HYErrortPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("关于页面"),
      ),
      body: Center(
        child: Column(
          children: [
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
