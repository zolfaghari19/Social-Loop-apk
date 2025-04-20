import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/article.dart';
import 'package:flutter_application/pages/home_page.dart';
import 'package:flutter_application/widget/navigation_item.dart';

class MyAppNavigation extends StatefulWidget {
  const MyAppNavigation({super.key});

  @override
  _MyAppNavigationState createState() => _MyAppNavigationState();
}

class _MyAppNavigationState extends State<MyAppNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });

    if (index == 0) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false, 
      );
    }

    if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ArticleScreen()),
      );
    }

    if (index == 2) {
    }
    if (index == 3) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff988487).withOpacity(0.3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _onItemTapped(0), 
                    child: MyAppNavigationItem(
                      iconFileName: "Home.png",
                      activeIconFileName: "Home.png",
                      title: "Home",
                      isSelected: _selectedIndex == 0,  
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onItemTapped(1),
                    child: MyAppNavigationItem(
                      iconFileName: "Articles.png",
                      activeIconFileName: "Articles.png",
                      title: "Articles",
                      isSelected: _selectedIndex == 1,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => _onItemTapped(2),
                    child: MyAppNavigationItem(
                      iconFileName: "Search.png",
                      activeIconFileName: "Search.png",
                      title: "Search",
                      isSelected: _selectedIndex == 2,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onItemTapped(3),
                    child: MyAppNavigationItem(
                      iconFileName: "Menu.png",
                      activeIconFileName: "Menu.png",
                      title: "Menu",
                      isSelected: _selectedIndex == 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: Colors.blueAccent,
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                ),
                child: Assets.icons.plus.image(
                  width: 65,
                  height: 65,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
