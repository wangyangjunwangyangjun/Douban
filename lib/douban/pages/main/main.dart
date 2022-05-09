import 'package:flutter/material.dart';
import 'initialize_items.dart';

class HYMainPage extends StatefulWidget {
  const HYMainPage({Key? key}) : super(key: key);

  @override
  State<HYMainPage> createState() => _HYMainPageState();
}

class _HYMainPageState extends State<HYMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        //多个页面重叠在一起时，可以指定某一个页面显示
        index: _currentIndex, //index为0时，显示第一个页面
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,     //显示图标下面的文字
        items: items,
        currentIndex: _currentIndex,  //当前需要展示的第几个

        //点击
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

