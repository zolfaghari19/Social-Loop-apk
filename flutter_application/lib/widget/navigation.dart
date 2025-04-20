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
      _selectedIndex = index; // تغییر ایندکس انتخاب شده
    });

    // ناوبری به صفحه Home
    if (index == 0) {
      // استفاده از pushAndRemoveUntil برای حذف تمامی صفحات قبلی
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false, // حذف تمامی صفحات قبلی از Back Stack
      );
    }

    if (index == 1) {
      // ناوبری به صفحه Article
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ArticleScreen()),
      );
    }

    // برای صفحات دیگر هم می‌توانید همین روش را اعمال کنید
    if (index == 2) {
      // مثلا برای صفحه Search
      // Navigator.pushReplacement یا روش مناسب دیگر
    }
    if (index == 3) {
      // مثلا برای صفحه Menu
      // Navigator.pushReplacement یا روش مناسب دیگر
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
                    onTap: () => _onItemTapped(0), // فراخوانی تابع برای ایندکس 0
                    child: MyAppNavigationItem(
                      iconFileName: "Home.png",
                      activeIconFileName: "Home.png",
                      title: "Home",
                      isSelected: _selectedIndex == 0, // بررسی وضعیت انتخاب
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
