import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/douban/model/home_model.dart';
import 'package:flutter_learn/douban/widgets/HYDashLineWidget.dart';
import 'package:flutter_learn/douban/widgets/HYStarRatingWidget.dart';
import 'package:stack_trace/stack_trace.dart';

import '../../utils/log.dart';

class HYHomeMovieItem extends StatelessWidget {
  final MovieItem movie;

  HYHomeMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xffcccccc)))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            SizedBox(
              height: 8,
            ),
            buildContent(),
            SizedBox(
              height: 8,
            ),
            buildFooter()
          ],
        ),
      ),
    );
  }

  // 1.头部的排名
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          //decoration与color不能并存
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  //1.内容的布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  buildContentInfo(),
                  const SizedBox(
                    width: 8,
                  ),
                  buildContentLine(),
                  const SizedBox(
                    width: 8,
                  ),
                  buildContentWish()
                ],
              ),
            )
        )
      ],
    );
  }

  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        movie.poster,
        height: 150,
      ),
    );
  }

  Widget buildContentInfo() {
    return Expanded(
      //文本转行显示
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContentInfoTitle(),
          SizedBox(
            height: 8,
          ),
          buildContentInfoRate(),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: buildContentInfoDesc(),
          ),
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    HyCustomTrace("这是一条测试信息!", StackTrace.current);

    //此处将row改为富文本，是因为要实现文本过长自动换行的功能
    return Text.rich(TextSpan(children: [
      WidgetSpan(
        child: Icon(
          Icons.play_circle_outline,
          color: Colors.redAccent,
          size: 24,
        ),
      ),
      TextSpan(
          text: movie.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      TextSpan(
          text: "[${movie.year}]",
          style: TextStyle(fontSize: 18, color: Colors.grey))
    ]));
  }

  Widget buildContentInfoRate() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Row(
        children: [
          HYStarRating(
            rating: movie.doubanRating,
            size: 20,
          ),
          Text(
            "${movie.doubanRating}",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget buildContentInfoDesc() {
    //补充：若是List<String>类型---movie.genre.join(" "); 列表以空格进行拼接
    //补充二：若是List<对象>类型---movie.casts.map((item) => item.name).toList().join("")

    return Text(
      "${movie.genre} / ${movie.country} / ${movie.description}",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget buildContentLine() {
    return Container(
      height: 100,
      child: HYDashLine(
        axis: Axis.vertical,
        dashWidth: .4,
        dashHeight: 6,
        count: 10,
        color: Colors.grey,
      ),
    );
  }

  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 44,
              width: 44,
              child: Image.asset(
                "assets/images/home/add_like.png",
              )),
          Text(
            "想看",
            style: TextStyle(
                fontSize: 15, color: Color.fromARGB(255, 235, 170, 60)),
          )
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        "${movie.originalName}",
        style: TextStyle(fontSize: 18, color: Color(0xff666666)),
      ),
    );
  }
}
