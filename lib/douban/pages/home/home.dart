import 'package:flutter/material.dart';
import 'home_content.dart';

class HYHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //组件Widget不会生成RenderObject
    // Container()
    // Text()

    //渲染Widget生成RenderObject
    // Padding()
    // Row()

    // StatefulElement
    // statelessElement

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
