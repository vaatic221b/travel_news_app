// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_news_app/models/post_model.dart';
import 'package:travel_news_app/models/short_model.dart';
import 'package:travel_news_app/models/user_model.dart';
import 'package:travel_news_app/screens/author.dart';
import 'package:travel_news_app/screens/post.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  List<ShortModel> shorts = [];
  List<UserModel> users = [];

//FUNCTIONS
  void _getUsers() {
    users = UserModel.getUsers();
  }

  void _getPosts(){
    posts = PostModel.getPosts();
  }

  void _getShorts(){
    shorts = ShortModel.getShorts();
  }

  @override
  Widget build(BuildContext context) {
    _getPosts();
    _getShorts();
    _getUsers();
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      bottomNavigationBar: SizedBox(
          height: 70, 
          child: bottomBar(),
        ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcome(),
              const SizedBox(height: 15),
              searchBar(),
              const SizedBox(height: 15),
              tags(),
              const SizedBox(height: 17),
              cardPosts(),
              const SizedBox(height: 25),
              bottomText(), 
              const SizedBox(height: 18),
              videoShorts()
      
            ]
          )
        ),
      )
    );
  }


// METHODS
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

  
  Container welcome() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 50, 30, 10),
      height: 60,
      color: const Color(0xFFFCFCFC),
      child: Row(
          children: [
            welcomePicture(),
            const SizedBox(width: 15),
            const SizedBox(
            width: 200,
              child: Column(              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),                
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontFamily: 'Gellix', 
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black, 
                  ),
                ),
                SizedBox(height: 6),            
                Text(
                  'Monday, 3 October',
                  style: TextStyle(
                    fontFamily: 'Gellix', 
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9397A0) 
                  ),
                ),
                Spacer(),              

                ],
              ),
            ),
          ]
        ),
      );
  }
  
  Container welcomePicture() {
    return Container(
                width: 49,
                height: 49,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), 
                  child: Image.asset('assets/images/welcomeMan.png', scale: 0.7),
                ),
              );

  }
  
  Container searchBar()
  {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          hintText: 'Search for article...',
          hintStyle: const TextStyle(
            fontFamily: 'Gellix',
            color: Color(0xFFA7A7A7),
            fontSize: 12
          ),
          suffixIcon: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: const Color(0xFF5474FD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Transform.scale(
              scale: 1.2, 
              child: SvgPicture.asset('assets/icons/search_icon.svg'),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none
          )
        )
      ),
    );
  }
  
  Container tags() {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35),
      child: const Row(
        children: [
          Align(
            child: Text(
              '#Health',
              style: TextStyle(
                fontFamily: 'Gellix',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9397A0)
              ),
            ),
          ),
          Spacer(),
          Align(
            child: Text(
              '#Music',
              style: TextStyle(
                fontFamily: 'Gellix',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9397A0)
              ),
            ),
          ),
          Spacer(),
          Align(
            child: Text(
              '#Technology',
              style: TextStyle(
                fontFamily: 'Gellix',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9397A0)
              ),
            ),
          ),
          Spacer(),
          Align(
            child: Text(
              '#Sports',
              style: TextStyle(
                fontFamily: 'Gellix',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF9397A0)
              ),
            ),
          ),
        ],
      ),
    );
  }
  
Container cardPosts() {
  return Container(
    height: 305,
    width: 500,
    color: const Color(0xFFFCFCFC),
    child: ListView.separated(
      itemCount: posts.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 4),
      separatorBuilder: (context, index) => const SizedBox(width: 25),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FullPost(postIndex: index); 
                  },
                ),
              );
            },
          child: Material(
            elevation: 0.5, 
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 270,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)
              ),
              child: postContent(index)
            )
          ),
        );
      }
    )
  );
}

Column postContent(int index) {
  return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Container(
                width: 240,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(posts[index].bgPath),
                    fit: BoxFit.cover
                  )
                )
              ),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SizedBox(
                width: 240,
                child: Text(
                  posts[index].line1,
                  overflow: TextOverflow.ellipsis, 
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15
                  )
                ),
              ),
            ),

            const SizedBox(height: 3),

            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SizedBox(
                width: 240,
                child: Text(
                  posts[index].line2,
                  overflow: TextOverflow.ellipsis, 
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15
                  )
                ),
              ),
            ),

            const SizedBox(height: 10),

            posterInfo(index),

            const SizedBox(height: 5)
          ],
        );
}


Container posterInfo(int index) {
  UserModel? matchingUser;
  for (UserModel user in users) {
    if (user.name == posts[index].name) {
      matchingUser = user;
      break; 
    }
  }
  return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              height: 45,
              child: Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AuthorProfile(authorIndex: index);
                            },
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(matchingUser?.dpPath ?? 'assets/images/blankDp'),
                      ),
                    ),
                  ),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AuthorProfile(authorIndex: index);
                                },
                              ),
                            );
                          },
                          child: Text(
                            posts[index].name,
                            style: const TextStyle(
                              fontFamily: 'Gellix',
                              fontWeight: FontWeight.w600,
                              fontSize: 13.5,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          '${posts[index].date}, 2022',
                          style: const TextStyle(
                          color: Color(0xFF9397A0),
                          fontFamily: 'Gellix',
                          fontWeight: FontWeight.w400,
                          fontSize: 13.5
                          )                           
                        )
                      ),
                    ],
                  ),

                  const Spacer(),
                  
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF5F4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Transform.scale(
                        scale: 0.5, 
                        child: SvgPicture.asset('assets/icons/share_icon.svg'),
                      )
                    ),
                  )
                  
                ],
              ),
            );
}

  
  Container bottomText() { 
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: const Row(
        children: [
          Expanded(
            child: Text(
              'Short For You',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
    
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'View all',
              style: TextStyle(
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
  
  Container videoShorts() {
      return Container(
      height: 100,
      width: 500,
      color: const Color(0xFFFCFCFC), 
      child: ListView.separated(
        itemCount: shorts.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 4),
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (contxt, index){
        return Material(
          elevation: 0.5, 
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          child: shortInfo(index),
          ),
        );
        }        
      ),
    );

  }
  
Container shortInfo(int index) {
  return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              height: 45,
              child: Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF5F4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              shorts[index].bgPath, 
                              fit: BoxFit.cover,
                            ),
                          ),
                          Center(
                            child: Transform.scale(
                              scale: 1,
                              child: SvgPicture.asset('assets/icons/play_icon.svg'),
                            )
                          )
                        ]
                      )
                    )
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          shorts[index].line1,
                          style: const TextStyle(
                            fontFamily: 'Gellix',
                            fontWeight: FontWeight.w600,
                            fontSize: 13.5
                          )
                        )
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          shorts[index].line2,
                          style: const TextStyle(
                            fontFamily: 'Gellix',
                            fontWeight: FontWeight.w600,
                            fontSize: 13.5
                          )                           
                        )
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          SvgPicture.asset('assets/icons/eye_icon.svg'),
                          const SizedBox(width: 5),
                          Text(
                          shorts[index].views,
                          style: const TextStyle(
                            color: Color(0xFF9397A0),
                            fontFamily: 'Gellix',
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5
                          )                           
                        )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
}
}
