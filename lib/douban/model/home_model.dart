int counter = 1;
class MovieItem {
  int rank = 0;
  String genre = "犯罪/剧情";
  String poster = "封面";
  String name = "电影名称";
  String year = "上映年份";
  double doubanRating = 10;
  String country = "国家";
  String language = "语言";
  String description = "简述";
  String originalName = "originalName";


  MovieItem.fromMap(Map<String, dynamic> json){
    rank = counter++;
    poster = json["data"][0]["poster"];
    genre = json["data"][0]["genre"];
    name = json["data"][0]["name"];
    year = json["year"];
    doubanRating = double.parse(json["doubanRating"]);
    country = json["data"][0]["country"];
    language = json["data"][0]["language"];
    description = json["data"][0]["description"];
    originalName = json["originalName"];
  }
}