class ShortModel{
  String bgPath;
  String line1;
  String line2;
  String views;

  ShortModel({
  required this.bgPath,
  required this.line1,
  required this.line2,
  required this.views,
  });

  static List<ShortModel> getShorts(){
    List<ShortModel> shorts = [];

    shorts.add(
      ShortModel(
        bgPath: 'assets/images/islandsBg.png', 
        line1: 'Top Trending',
        line2: 'Islands in 2022',
        views: '40,999')
    );

    shorts.add(
      ShortModel(
        bgPath: 'assets/images/chinaBg.png', 
        line1: 'China',
        line2: 'Trading',
        views: '40,999')
    );

    return shorts;

  }

}

