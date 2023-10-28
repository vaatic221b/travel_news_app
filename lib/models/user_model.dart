class UserModel{
  String dpPath;
  String name;
  String role;
  String bio;
  String following;
  String posts;
  String followers;

  UserModel({
  required this.dpPath,
  required this.name,
  required this.role,
  required this.bio,
  required this.following,
  required this.posts,
  required this.followers

  });

  static List<UserModel> getUsers(){
    List<UserModel> users = [];

    users.add(
      UserModel(
        dpPath: 'assets/images/sangDp.png', 
        name: 'Sang Dong-Min', 
        role: 'Travel Blogger',
        bio: 'Exploring the world, one adventure at a time, and sharing my wanderlust with you.',
        following: '20.1k',
        posts: '1.9k',
        followers: '15.8k' 
        )
    );

    users.add(
      UserModel(
        dpPath: 'assets/images/panDp.png', 
        name: 'Pan Bong', 
        role: 'News Journalist',
        bio: 'Bringing you the latest updates and stories that matter, one headline at a time.',
        following: '30.7k',
        posts: '2.6k',
        followers: '25.5k' 
        )
    );

    users.add(
      UserModel(
        dpPath: 'assets/images/keanuDp.png', 
        name: 'Keanu Carpent', 
        role: 'Writer',
        bio: 'Crafting words and stories that inspire, entertain, and transport you to new worlds.',
        following: '40.4k',
        posts: '3.2k',
        followers: '35.1k' 
        )
    );


    users.add(
      UserModel(
        dpPath: 'assets/images/ellyDp.png', 
        name: 'Elly Byers', 
        role: 'Author & Writer',
        bio: 'Every piece of chocolate I ever ate is getting back at me.. desserts are very revengeful..',
        following: '54.21k',
        posts: '2.11k',
        followers: '36.40k' 
        )
    );

    return users;

  }

}

