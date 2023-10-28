class PostModel{
  String bgPath;
  String line1;
  String line2;
  String name;
  String date;
  String description;
  String length;
  String category;
  String time;

  PostModel({
  required this.bgPath,
  required this.line1,
  required this.line2,
  required this.name,
  required this.date,
  required this.description,
  required this.length,
  required this.category,
  required this.time

  });

  static List<PostModel> getPosts(){
    List<PostModel> posts = [];

    posts.add(
      PostModel(
        bgPath: 'assets/images/maldivesBg.png', 
        line1: 'Feel the thrill on the only',
        line2: 'surf simulator in Maldives 2022', 
        name: 'Sang Dong-Min', 
        date: 'Sep 9',
        description: "The Maldives unveils an exciting surf simulator for adventure seekers in 2022. Visitors can now catch the perfect wave without leaving the island's idyllic shores, making it a must-visit destination for surf enthusiasts.",
        length: '9',
        category: 'Travel',
        time: '02:45 pm'
        )
    );

    posts.add(
      PostModel(
        bgPath: 'assets/images/hongkongBg.png', 
        line1: 'Hong Kong wins over Wall',
        line2: 'Street CEOs after lifting strict regulations',
        name: 'Pan Bong', 
        date: 'Jan 3',
        description: "Hong Kong's recent regulatory changes are capturing the attention of top Wall Street CEOs. The city's financial landscape is evolving, drawing executives and reshaping the global financial industry. Wall Street leaders are turning their focus to this dynamic Asian financial hub.",
        length: '10',
        category: 'Business',
        time: '10:30 am'
        )
    );

    posts.add(
      PostModel(
        bgPath: 'assets/images/mysteryBg.png', 
        line1: 'Unravel mysteries', 
        line2: 'of the Maldives', 
        name: 'Keanu Carpent', 
        date: 'May 17',
        description: "Just say anything, George, say what ever's natural, the first thing that comes to your mind. Take that you mutated son-of-a-bitch. My pine, why you. You space bastard, you killed a pine. You do? Yeah, it's 8:00. Hey, McFly, I thought I told you never",
        length: '8',
        category: 'Travel',
        time: '08:00 pm'
        )
    );


    posts.add(
      PostModel(
        bgPath: 'assets/images/protestBg.png', 
        line1: "Iran's raging protests", 
        line2: 'Fifth Iranian paramilitary membership', 
        name: 'Elly Byers', 
        date: 'May 16',
        description: "Iran witnesses escalating protests as the Fifth Iranian Paramilitary group emerges, further fueling the nation's unrest. The group's sudden appearance adds a new dimension to the ongoing turmoil, and the country remains on edge.",
        length: '11',
        category: 'Politics',
        time: '09:32 pm'
        )
    );

    posts.add(
      PostModel(
        bgPath: 'assets/images/ceremonyBg.png', 
        line1: "Putin to host ceremony", 
        line2: 'annexing occupied Ukrainian Territory', 
        name: 'Elly Byers', 
        date: 'May 11',
        description: "Russian President Vladimir Putin took center stage today in a highly contentious ceremony, marking the formal annexation of Ukrainian territory under Russian control. This move has sent shockwaves throughout the international community, igniting a fresh wave of tensions in Eastern Europe and raising significant geopolitical concerns.",
        length: '10',
        category: 'Science',
        time: '10:15 am'
        )
    );

    return posts;

  }

}

