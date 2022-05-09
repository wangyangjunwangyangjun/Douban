import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HYHomeContent()
    );
  }
}
class HYHomeContent extends StatelessWidget {
  const HYHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlexDemo(),
      appBar: AppBar(
        title: Text("布局"),
      ),
    );
  }
}

class FlexDemo extends StatefulWidget {
  const FlexDemo({Key? key}) : super(key: key);

  @override
  State<FlexDemo> createState() => _FlexDemoState();
}

class _FlexDemoState extends State<FlexDemo> {
  @override
  Widget build(BuildContext context) {
    //Row/Column：继承自Flex
    //Flex：CSS Flex布局
    //Axis.horizontal水平Row；Axis.vertical垂直colum
    return Container(
      height: 300,
      child: Row(
        /**
         * start是主轴开始、end是主轴结束开始、center是主轴中心开始，其他元素评分距离
         * MainAxisAlignment
         * -spacebetween是左右两边设置为0，其他元素之间平分间距
         * -spaceAround左右两边的间距是其他元素之间的间距的一半
         * -spaceEvenly所有间距均分距离
         * CrossAxisAlignment
         * -start从交叉轴起始位置对齐
         * -end从交叉轴结束为止对齐
         * -center中心对齐
         * -baseline基线对齐,按照文字的基线对齐，当内容有文本时，基线对齐才起作用
         * -stretch是现将Row尽可能的拉伸最大的空间，将所有的子Widget交叉轴的高度拉伸到最大
         */
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textBaseline: TextBaseline.alphabetic,
        // textDirection: TextDirection.rtl,
        children: [
          Container(width: 80, height: 60,color: Colors.red, child: Text("Hello", style: TextStyle(fontSize: 10),)),
          Container(width: 90, height: 100,color: Colors.green, child: Text("Hello", style: TextStyle(fontSize: 30),)),
          Container(width: 50, height: 120,color: Colors.orange, child: Text("Hello", style: TextStyle(fontSize: 20),)),
          Container(width: 70, height: 110,color: Colors.blue, child: Text("Hello", style: TextStyle(fontSize: 40),)),
        ],),
    );
  }
}
class FlexDemo02 extends StatefulWidget {
  const FlexDemo02({Key? key}) : super(key: key);

  @override
  State<FlexDemo02> createState() => _FlexDemo02State();
}

class _FlexDemo02State extends State<FlexDemo02> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () => print("按钮点击"),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.pets),
          Text("button")
        ],
      ),
    );
  }
}

class FlexDemo03 extends StatefulWidget {
  const FlexDemo03({Key? key}) : super(key: key);

  @override
  State<FlexDemo03> createState() => _FlexDemo03State();
}

class _FlexDemo03State extends State<FlexDemo03> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          /**
           * Flexible中的属性：
           * - flex
           * Expanded（更多）-》flexible（fit：Flexfit:tight)
           * 空间分配问题
           *
           */
          Expanded(
              flex: 1,
              child: Container(
                width: 50,
                height: 60,
                color: Colors.red,
              )
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 50,
              height: 100,
              color: Colors.green,
            ),
          ),
          Container(
            width: 50,
            height: 120,
            color: Colors.orange,
          ),
          Container(
            width: 70,
            height: 110,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}