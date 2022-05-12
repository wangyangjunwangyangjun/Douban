import 'package:flutter/material.dart';

class HYDetailScreen extends StatelessWidget {
  static const String routername = "/detail";

  String _message;
  HYDetailScreen(this._message);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _backToHome(context);
        /**
         * 当返回true时，可以自动返回
         * 当返回false时，自行返回代码
         */
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("data"),
          // leading: IconButton(onPressed: () => {
          //   _backToHome(context)
          // }, icon: Icon(Icons.back_hand)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_message,style: TextStyle(fontSize: 20,color: Colors.red),),
              RaisedButton(
                  child: Text("back"),
                  onPressed: () {
                    _backToHome(context);
                  })
            ],
          ),
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    Navigator.of(context).pop("a detail message");
  }
}
