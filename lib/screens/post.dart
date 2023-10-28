// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_news_app/models/post_model.dart';
import 'package:travel_news_app/models/user_model.dart';
import 'package:travel_news_app/screens/author.dart';
import 'package:travel_news_app/screens/home.dart';



class FullPost extends StatefulWidget {
  final int postIndex;

  const FullPost({
    Key? key,
    required this.postIndex,
  }) : super(key: key);

  @override
  State<FullPost> createState() => _FullPostState();
}

class _FullPostState extends State<FullPost> {
  int selectedIndex = 0; 
  List<Widget> iconList = [
    SvgPicture.asset('assets/icons/home_unselected_icon.svg'),
    SvgPicture.asset('assets/icons/bookmark_unselected_icon.svg'),
    SvgPicture.asset('assets/icons/notification_unselected_icon.svg'),
    SvgPicture.asset('assets/icons/profile_unselected_icon.svg'),
  ];

  List<Widget> selectedIconList = [
    SvgPicture.asset('assets/icons/home_selected_icon.svg'),
    SvgPicture.asset('assets/icons/bookmark_selected_icon.svg'),
    SvgPicture.asset('assets/icons/notification_selected_icon.svg'),
    SvgPicture.asset('assets/icons/profile_selected_icon.svg'),
  ];

  List<PostModel> posts = [];
  List<UserModel> users = [];

//FUNCTIONS
  void _getPosts() {
    posts = PostModel.getPosts();
  }

  void _getUsers() {
    users = UserModel.getUsers();
  }

  @override
Widget build(BuildContext context) {
  _getPosts();
  _getUsers();
  return Scaffold(
    bottomNavigationBar: SizedBox(
      height: 70, 
      child: bottomBar(),
    ),
    body: Stack(
      children: [
        Image.asset(
          posts[widget.postIndex].bgPath,
          fit: BoxFit.fill,
          width: 500,
          height: 500,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              topImageIcons(context),
              completePost(),
            ],
          ),
        ),
      ],
    ),
  );
}

//METHODS
  Container completePost() {
    return Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFCFCFC),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  postTitle(),
                  postInfo(),
                  postDescription(),
                  const SizedBox(height: 22)
                ],
              ),
            );
  }

  Stack topImageIcons(BuildContext context) {
    return Stack(
      children: [
              Container(
                padding: const EdgeInsets.only(top: 380),
              ),

              Positioned(
                left: 30,
                top: 55,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: Transform.scale(
                      scale: 0.4,
                      child: SvgPicture.asset(
                        'assets/icons/chevron_icon.svg',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 30,
                top: 55,
                child: Container(
                  width: 45, 
                  height: 45, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: Transform.scale(
                    scale: 0.4, 
                    child: SvgPicture.asset(
                      'assets/icons/bookmark_white_icon.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 100,
                left: 100,
                bottom: 10,
                child: SvgPicture.asset(
                  'assets/icons/stars.svg',
                  height: 25,
                  width: 25,
                ),
              )
      ],
    );
  }
  
  Padding postTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 50),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              '${posts[widget.postIndex].line1} ${posts[widget.postIndex].line2}',
              style: const TextStyle(
                fontFamily: 'Gellix',
                fontWeight: FontWeight.w800,
                fontSize: 32,
                letterSpacing: 0.9
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  
  Padding postInfo() {
    UserModel? matchingUser;
    for (UserModel user in users) {
      if (user.name == posts[widget.postIndex].name) {
        matchingUser = user;
        break; 
      }
    }
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: Container(
          width: 350,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
            color: const Color(0xFFEEEEEE), 
            width: 1, 
        ),
          ),
          child: Row(
            children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AuthorProfile(authorIndex: widget.postIndex); 
                            },
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(matchingUser?.dpPath ?? 'assets/images/blankDp'),
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AuthorProfile(authorIndex: widget.postIndex); 
                            },
                          ),
                        );
                      },
                      child: Text(
                        posts[widget.postIndex].name,
                        style: const TextStyle(
                          fontFamily: 'Gellix',
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),


                  Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          posts[widget.postIndex].date,
                          style: const TextStyle(
                            fontFamily: 'Gellix',
                            fontSize: 13,
                            fontWeight: FontWeight.w300
                          )
                        )
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.brightness_1, size: 4, color: Color(0xFF9397A0)), 
                        const SizedBox(width: 10), 
                        Text(
                          '${posts[widget.postIndex].length} min read',
                          style: const TextStyle(
                            fontFamily: 'Gellix',
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  )      
            ],
          ),
        )
    );
  }

  Padding postDescription() {
    return Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: Text(
                      posts[widget.postIndex].description,
                      style: const TextStyle(
                        fontFamily: 'Gellix',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  );
  }

  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: selectedIndex == 0 ? selectedIconList[0] : iconList[0],
          label: '',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 1 ? selectedIconList[1] : iconList[1],
          label: '',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 2 ? selectedIconList[2] : iconList[2],
          label: '',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 3 ? selectedIconList[3] : iconList[3],
          label: '',
        )
      ],
      
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));    
            
            setState(() {
            selectedIndex = index;
            });
            break;
          //supposedly include other cases for bookmarks, notifs, and profile if this was a real app.
          default:
            setState(() {
            selectedIndex = index;
            });
            break;
        }
      },
    );
  }
}