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
      body: ContainerDemo(),
      appBar: AppBar(
        title: Text("布局"),
      ),
    );
  }
}

class ContainerDemo extends StatefulWidget {
  const ContainerDemo({Key? key}) : super(key: key);

  @override
  State<ContainerDemo> createState() => _ContainerDemoState();
}

class _ContainerDemoState extends State<ContainerDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //这里的颜色加上会与decoration里面的颜色冲突，选择其中一个
      // color: Colors.red,
      width: 200,
      height: 200,
      //在container里面加入Alignment，里面有子组件时，构成一个三层机构，子组件文本不会放大，在Align里面居中显示
      //若不加上Alignment会使Text扩大到Container设置的宽度高度一般大小，这样文本从左上角开始排列，也就不是居中了
      // alignment: Alignment(0,0),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(50),
      child: Text("data"),
      // child: Icon(Icons.pets, size: 50, color: Colors.blue,),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
              width: 5,
              color: Colors.black
          ),
          //圆形设置为100
          // borderRadius: BorderRadius.circular(100),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            //Offset(x,y)，x为正，往右，y为正，往下
            //spreadRadius延伸，在offset基础上延伸，blurRadius是模糊
            BoxShadow(color: Colors.orange,offset: Offset(10,10),spreadRadius: 5,blurRadius: 10),
            BoxShadow(color: Colors.green,offset: Offset(-10,-10),spreadRadius: 5,blurRadius: 10)
          ]
      ),
    );
  }
}



class PaddingDemo extends StatefulWidget {
  const PaddingDemo({Key? key}) : super(key: key);

  @override
  State<PaddingDemo> createState() => _PaddingDemoState();
}

class _PaddingDemoState extends State<PaddingDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          //EdgeInsets.symmetric(vertical: 5,horizontal: 0)
          padding: const EdgeInsets.only(
              bottom: 10
          ),
          child: Text("Hello WYJ", style: TextStyle(fontSize: 30, backgroundColor: Colors.red),),
        ),
        Text("Hello WYJ", style: TextStyle(fontSize: 30, backgroundColor: Colors.red),),
        Text("Hello WYJ", style: TextStyle(fontSize: 30, backgroundColor: Colors.red),)
      ],
    );
  }
}


class AlignDemo extends StatefulWidget {
  const AlignDemo({Key? key}) : super(key: key);

  @override
  State<AlignDemo> createState() => _AlignDemoState();
}

class _AlignDemoState extends State<AlignDemo> {
  @override
  Widget build(BuildContext context) {
    //Center就是Align
    return Container(
      width: 200,
      height: 200,
      color: Colors.amber,
      child: Align(
        // //高度和宽度的倍数
        // widthFactor: 5,
        // heightFactor: 5,
        //左上角为(-1,-1),右下角为(1,1),中心点为(0,0)
        alignment: Alignment(0, 0),
        child: Text("Hello"),
        // child: Icon(Icons.pets, size: 100,),
      ),
    );
  }
}