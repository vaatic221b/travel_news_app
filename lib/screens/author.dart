// ignore_for_file: library_private_types_in_public_api, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_news_app/models/picture_model.dart';
import 'package:travel_news_app/models/post_model.dart';
import 'package:travel_news_app/models/user_model.dart';
import 'package:travel_news_app/screens/home.dart';
import 'package:travel_news_app/screens/post.dart';



class AuthorProfile extends StatefulWidget {
  final int authorIndex;

  const AuthorProfile({
    Key? key,
    required this.authorIndex,
  }) : super(key: key);

  @override
  State<AuthorProfile> createState() => _AuthorProfileState();
}

class _AuthorProfileState extends State<AuthorProfile> {
  int selectedIndex = 0;
  String buttonText = 'Following';  

  List<PostModel> posts = [];
  List<UserModel> users = [];
  List<PictureModel> pictures = [];

//FUNCTIONS
  int findPostIndexByLine1(String line1) {
  for (int i = 0; i < posts.length; i++) {
    if (posts[i].line1 == line1) {
      return i;
    }
  }
  return -1; 
  }

  void _getPosts() {
    posts = PostModel.getPosts();
  }

  void _getUsers() {
    users = UserModel.getUsers();
  }

  void _getPictures() {
    pictures = PictureModel.getPictures();
  }

  @override
  Widget build(BuildContext context) {
    _getPosts();
    _getUsers();
    _getPictures();
    UserModel? matchingUser;
      for (UserModel user in users) {
      if (user.name == posts[widget.authorIndex].name) {
        matchingUser = user;
        break; 
      }
    }
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              followAuthor(matchingUser),
              const SizedBox(height: 5),
              profileBio(matchingUser),
              const SizedBox(height: 20),
              userStats(matchingUser),
              const SizedBox(height: 25),
              middleText(),
              const SizedBox(height: 20),
              userPosts(),
              const SizedBox(height: 20),
              bottomText(),
              const SizedBox(height: 25),
              userGallery(),
              const SizedBox(height: 20),

      
            ]
          )
        ),
      )
    );
  }

//METHODS
  Container followAuthor(UserModel? matchingUser) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 45, 30, 10),
      height: 100,
      color: const Color(0xFFFCFCFC),
      child: Row(
        children: [
          authorPicture(matchingUser),
          const SizedBox(width: 10),
          authorDetails(matchingUser),
          const Spacer(),
          followButton(),

        ],
      ),
    );
  }

  SizedBox authorDetails(UserModel? matchingUser) {
    return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                posts[widget.authorIndex].name,
                style: const TextStyle(
                  fontFamily: 'Gellix',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                matchingUser?.role ?? '',
                style: const TextStyle(
                  fontFamily: 'Gellix',
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
            ],
          ),
        );
  }

  
  Container authorPicture(UserModel? matchingUser) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          matchingUser?.dpPath ?? 'assets/images/blankDp',
          fit: BoxFit.fill, 
        ),
      ),
    );
  }
  
  ElevatedButton followButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          buttonText = (buttonText == 'Follow') ? 'Following' : 'Follow';
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5474FD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),

        minimumSize: const Size(120, 50), 
        maximumSize: const Size(200, 50),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Gellix',
          fontSize: 12
        ),
      ),
    );
  }
  
  Container profileBio(UserModel? matchingUser) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 60),
      color: const Color(0xFFFCFCFC),
      height: 40,
      child: Text(
        matchingUser?.bio ?? '',
        style: const TextStyle(
          fontFamily: 'Gellix',
          color: Color(0xFF9397A0),
          fontWeight: FontWeight.w500,
          fontSize: 13
        ),
      ),
    );
  }
  
  Container userStats(UserModel? matchingUser) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF19202D),
      ),
      child: Center(
        child: Row(
          children: [
            followingCount(matchingUser),
            lineDivider(),
            postsCount(matchingUser),
            lineDivider(),
            followersCount(matchingUser),
          ],
        ),
      ),
    );
  }

  Container lineDivider() {
    return Container(
            color: const Color(0xFFC1D4F9).withOpacity(0.2), 
            width: 1,
            height: 38,
          );
  }

  Expanded followersCount(UserModel? matchingUser) {
    return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  matchingUser?.followers ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                  ),
                  ),

                const SizedBox(height: 5),

                const Text(
                  "Followers",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12 
                  ),
                  ),
              ],
            ),
          );
  }

  Expanded postsCount(UserModel? matchingUser) {
    return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  matchingUser?.posts ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                  ),
                  
                  ),

                const SizedBox(height: 5),

                const Text(
                  "Posts",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                  ),
                  ),
              ],
            ),
          );
  }

  Expanded followingCount(UserModel? matchingUser) {
    return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  matchingUser?.following ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Gellix',
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                  ),

                ),

                const SizedBox(height: 5),
              
                const Text(
                  "Following",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                  ),
                ),
              ],
            ),
          );
  }
  
  Container middleText() { 
    String authorName = posts[widget.authorIndex].name;
    List<String> nameParts = authorName.split(" ");
    String firstName = nameParts.first;
    String modifiedName = "$firstName's Post";

    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        children: [
          
          Expanded(
            child: Text(
              modifiedName,
              style: const TextStyle(
                fontFamily: 'Gellix',
                fontSize: 17,
                fontWeight: FontWeight.w700
              ),
            ),
          ),

          const Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'View all',
              style: TextStyle(
                fontFamily: 'Gellix',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF5474FD),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Container userPosts() {
    List<PostModel> matchingPosts = posts.where((post) => post.name == posts[widget.authorIndex].name).toList();
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      height: 250,
      color: const Color(0xFFFCFCFC),
      child: ListView.separated(
        itemCount: matchingPosts.length,
        padding: const EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          PostModel post = matchingPosts[index];
          return GestureDetector(
            onTap: () {
              int postIndex = findPostIndexByLine1(post.line1);
              if (postIndex >= 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FullPost(postIndex: postIndex);
                    },
                  ),
                );
              }
            },
            child: Container(
              width: 300, 
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFFFCFCFC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Material(
                    elevation: 2.0, 
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 100, 
                      height: 100, 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white, 
                          width: 2.0, 
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2), 
                        child: SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              post.bgPath, 
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            'News: ${post.category}',
                            style: const TextStyle(
                              fontFamily: 'Gellix',
                              fontSize: 11,
                              color: Color(0xFF9397A0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            post.line1,
                            overflow: TextOverflow.ellipsis, 
                            maxLines: 1,
                            style: const TextStyle(
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 2),
                          child: SizedBox(
                            width: 210,
                            height: 20,
                            child: Text(
                              post.line2,
                              overflow: TextOverflow.ellipsis, 
                              maxLines: 1,
                              style: const TextStyle(
                                fontFamily: 'Gellix',
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            SvgPicture.asset('assets/icons/calendar_icon.svg'),
                            const SizedBox(width: 5),
                            Text(
                              '${post.date.split(' ')[1]}th ${post.date.split(' ')[0]}',
                              style: const TextStyle(
                                color: Color(0xFF9397A0),
                                fontFamily: 'Gellix',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 65),
                            SvgPicture.asset('assets/icons/time_icon.svg'),
                            const SizedBox(width: 5),
                            Text(
                              post.time,
                              style: const TextStyle(
                                color: Color(0xFF9397A0),
                                fontFamily: 'Gellix',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container bottomText() { 
    String authorName = posts[widget.authorIndex].name;
    List<String> nameParts = authorName.split(" ");
    String firstName = nameParts.first;
    String modifiedName = "Popular From $firstName";

    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Text(
        modifiedName,
        style: const TextStyle(
          fontFamily: 'Gellix',
          fontSize: 17,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }

  
  Container userGallery() {
    List<PictureModel> matchingPictures = pictures.where((picture) => picture.name == posts[widget.authorIndex].name).toList();
    return Container(
      margin: const EdgeInsets.only(left: 30),
      height: 130,
      width: 600,
      color: const Color(0xFFFCFCFC),
      child: ListView.separated(
        itemCount: matchingPictures.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          PictureModel picture = matchingPictures[index];
          return Material(
            elevation: 0.5,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 225,
              decoration: BoxDecoration(
                color: const Color(0xFFFCFCFC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), 
                child: Image(
                  image: AssetImage(picture.picPath),
                  fit: BoxFit.cover, 
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}

