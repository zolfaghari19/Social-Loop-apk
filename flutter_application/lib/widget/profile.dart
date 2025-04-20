import 'package:flutter/material.dart';
import 'package:flutter_application/widget/data.dart';
import 'package:flutter_application/pages/main_profile.dart';

class MyAppProfiles extends StatelessWidget {
  const MyAppProfiles({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;

    return Container(
      height: 100, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        itemCount: stories.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final story = stories[index];

          return GestureDetector(
            onTap: () {
              if (index == 0) {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 200),
                    pageBuilder: (context, animation, secondaryAnimation) => MainProfile(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            colors: [
                              Color(0xff376AED),
                              Color(0xff49B0E2),
                              Color(0xff9CECFB),
                            ],
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(17),
                            child: Image.asset(
                              "assets/stories/${story.imageFileName}",
                              width: 68,
                              height: 68,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          "assets/icons/${story.iconFileName}",
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    story.name,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
