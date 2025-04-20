import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widget/data.dart';
import 'package:flutter_application/widget/details_posts.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/pages/article.dart';
import 'package:flutter_application/widget/navigation.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({super.key});

  @override
  _MainProfileState createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    HomePage(),
    ArticleScreen(),
    MainProfile(),
  ];

  void _onItemTapped(int index) {
    if (index != 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => _pages[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final post = AppDatabase.posts;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.withOpacity(0),
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.more_horiz_rounded),
            onPressed: () {},
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20,
                          color: Colors.black.withOpacity(0.1)),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.stories.story9
                                  .image(width: 87, height: 84)),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("@Emilia23",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(height: 4),
                                  Text("Emilia Daniel",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      )),
                                  SizedBox(height: 8),
                                  Text("Flutter Developer ",
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 23, 89, 142))),
                                ]),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                      child: Text("About Me",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
                      child: Text(
                        "As a Flutter developer, I specialize in building cross-platform applications using the Dart programming language.",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 40)
                  ],
                ),
              ),
            ],
          ),

          // باکس آبی برای تعداد پست‌ها و تعاملات
          Container(
            margin: const EdgeInsets.fromLTRB(32, 0, 32, 30), // تغییر margin برای جابجایی به بالاتر
            decoration: BoxDecoration(
              color: Colors.blue, // آبی رنگ
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // بخش پست‌ها
                  Column(
                    children: [
                      Text(
                        "52",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Post",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "250",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Following",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  // بخش فالوورها
                  Column(
                    children: [
                      Text(
                        "4.5K",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Followers",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 16, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text("My Posts",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16)),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Assets.icons.grid.svg(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Assets.icons.table.svg(),
                      ),
                    ],
                  ),
                ),
                MyAppdetailsPost(
                  post: post[0],
                  category: AppDatabase.categories[0],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyAppNavigation(),
    );
  }
}
