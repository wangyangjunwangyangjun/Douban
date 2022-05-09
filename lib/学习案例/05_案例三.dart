import 'package:flutter/material.dart';
import 'package:flutter_learn/%E5%AD%A6%E4%B9%A0%E6%A1%88%E4%BE%8B/02_checkbox.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        title: Text("商品列表"),
      ),
      body: HYHomeContent(),
    );
  }
}
class HYHomeContent extends StatelessWidget {
  const HYHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Column能使里面的Widget按列的形式排列
    return ListView(
      children: [
        HYHomeProjectItem("Apple", "MacBook", "https://wx2.sinaimg.cn/mw1024/005yGqLdly1h1uknlr8ojj30wi0f0t9k.jpg"),
        HYHomeProjectItem("banana", "WindowsBook", "https://wx3.sinaimg.cn/mw1024/005yGqLdly1h1uknm0xr4j30wi0f0wey.jpg"),
        HYHomeProjectItem("orange", "LinuxBook", "https://wx2.sinaimg.cn/mw1024/6c5b0aa9gy1h1uyicv0zzj20ah0cs74n.jpg"),
      ],
    );
  }
}
class HYHomeProjectItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;

  //全局变量
  final style_orange = TextStyle(fontSize: 25, color: Colors.orange);
  final style_green = TextStyle(fontSize: 25, color: Colors.green);

  HYHomeProjectItem(this.title, this.desc, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(//alter+enter添加Container
      //内间距
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          border: Border.all(
              width: 6,//边框的宽度
              color: Colors.pink//边框的颜色
          )
      ),
      child: Column(
        //靠左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: style_orange,),
          SizedBox(height: 8,),
          Text(desc, style: style_green,),
          SizedBox(height: 8,),
          Image.network(imageURL)
        ],
      ),
    );
  }
}