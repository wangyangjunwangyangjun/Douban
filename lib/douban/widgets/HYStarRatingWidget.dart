import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HYStarRating extends StatefulWidget {
  final double rating; //分数
  final double maxRating; //最大分数
  final int count; //星星的棵树
  final double size; //星星的大小
  final Color unselectedColor; //未选中的星星颜色
  final Color selectedColor; //选中的星星颜色
  final Widget selectedImage; //选中后的图片
  final Widget unselectedImage; //未选中时的图片

  //构造函数
  HYStarRating({
    required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    selectedImage,
    unselectedImage,

    //初始化列表
  })  : unselectedImage = unselectedImage ??
            Icon(Icons.star_border, color: unselectedColor, size: size),
        selectedImage =
            selectedImage ?? Icon(Icons.star, color: selectedColor, size: size);

  @override
  State<HYStarRating> createState() => _HYStarRatingState();
}

class _HYStarRatingState extends State<HYStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          //设置row为最短长度，从而居中
          mainAxisSize: MainAxisSize.min,
          children: buildUnselectedStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStar(),
        )
      ],
    );
  }

  //生成指定个数的图标（未选中时的星星）
  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar() {
    final star = widget.selectedImage;
    List<Widget> stars = [];
    double oneValue = widget.maxRating / widget.count; //计算一个星星的分值
    int entireCount = (widget.rating / oneValue).floor(); //floor向下取整；ceil向上取整

    //完整星星
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }

    //剩余部分多大
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halStar = ClipRect(
      clipper: HYStarClipper(leftWidth), //裁剪星星
      child: star,
    );
    stars.add(halStar);

    //超过最大判断
    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }
    return stars;
  }
}

class HYStarClipper extends CustomClipper<Rect> {
  //以矩形传入对象进行裁剪
  double width;

  //构造函数
  HYStarClipper(this.width);

  @override
  Rect getClip(Size size) {
    //从左侧0开始到距离20，从顶部0到距离整个大小都保留，剩余部分裁剪
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  //重新剪裁
  @override
  bool shouldReclip(HYStarClipper oldClipper) {
    return oldClipper.width != width;
  }
}
