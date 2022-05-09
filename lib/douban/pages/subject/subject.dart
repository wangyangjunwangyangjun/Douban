import 'package:flutter/material.dart';

class HYSubjectPage extends StatelessWidget {
  const HYSubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("影音"),
            ],
          ),
        ),
        body: Text("影音"));
  }
}
