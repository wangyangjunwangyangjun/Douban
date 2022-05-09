import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}
class HYHomePage extends StatelessWidget {
  const HYHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础的Widget"),
      ),
      body: HYHomeContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("FloatingActionButton Click"),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
class HYHomeContent extends StatefulWidget {
  const HYHomeContent({Key? key}) : super(key: key);

  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //Column主轴是垂直，Row主轴是水平，Column在交叉轴上会居中显示内容
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => print("ElevatedButton Click"),
          child: Text("ElevatedButton"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => print("TextButton Click"),
          child: Text("TextButton"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        OutlinedButton(
          onPressed: () => print("OutlineButton"),
          child: Text("OutlinedButton"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => print("click"),
          child: Row(
            //row默认会在主轴延伸至最大，这里设置为最小
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite, color: Colors.redAccent),
              Text("喜欢作者")
            ],
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                  ContinuousRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  )
              )
          ),
        )
      ],
    );
  }
}

// return Text.rich(
//   TextSpan(
//     children: [
//       TextSpan(text: "Hello World",style: TextStyle(color: Colors.red, fontSize: 20)),
//       WidgetSpan(child: Icon(Icons.favorite, color: Colors.red,)),
//       TextSpan(text: "Hello World",style: TextStyle(color: Colors.red, fontSize: 20)),
//     ]
//   )
// );