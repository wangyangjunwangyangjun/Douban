import 'package:flutter/material.dart';
import 'home_content.dart';

class HYHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("首页"),
          ],
        ),
      ),
      body: HYHomeContent(),
    );
  }
}
