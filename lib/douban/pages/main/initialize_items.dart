import 'package:flutter/cupertino.dart';
import '../subject/subject.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';

//底部导航栏数据
List<HYBottomBarItem> items = [
  HYBottomBarItem("home", "主页"),
  HYBottomBarItem("video", "影音"),
  HYBottomBarItem("mall", "购物"),
  HYBottomBarItem("group", "群组"),
  HYBottomBarItem("profile", "个人"),
];

List<Widget> pages = [
  HYHomePage(),
  HYSubjectPage(),
  HYSubjectPage(),
  HYSubjectPage(),
  HYSubjectPage(),
];