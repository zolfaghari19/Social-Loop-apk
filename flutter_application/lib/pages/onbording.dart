import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/pages/login_page.dart';
import 'package:flutter_application/widget/data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pagecontroller = PageController();
  final items = AppDatabase.onBoardingItems;
  int page = 0;


  @override
  void initState() {
    super.initState();
    _pagecontroller.addListener(() {
      if (_pagecontroller.page!.round()!= page) {
        setState(() {
          page = _pagecontroller.page!.round();
          debugPrint("Onboarding : Selected Page -> $page");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Assets.background.onboarding.image(),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 324,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: PageView.builder(
                              controller: _pagecontroller,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(32),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index].title,
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Text(items[index].description,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black)),
                                    ],
                                  ),
                                );
                              })),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.only(
                            left: 32, right: 32, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: _pagecontroller,
                              count: items.length,
                              effect: ExpandingDotsEffect(
                                  dotWidth: 8,
                                  dotHeight: 8,
                                  activeDotColor: Colors.blue),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (page == items.length - 1) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => MyAppLoginPage()));
                                } else {
                                  _pagecontroller.animateToPage(page + 1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.decelerate);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                maximumSize: const Size(84, 60),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Icon(
                                page == items.length-1
                                    ? CupertinoIcons.check_mark
                                    : CupertinoIcons.arrow_right,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
