import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/gen/fonts.gen.dart';
import 'package:flutter_application/pages/article.dart';
import 'package:flutter_application/widget/Click_Icon.dart';
import 'package:flutter_application/widget/data.dart';

class MyAppdetailsPost extends StatelessWidget {
  const MyAppdetailsPost({super.key, required Category category, required PostData post});

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 24, top: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Latest News",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(50, 30),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "More",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          itemCount: posts.length,
          itemExtent: 141,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final post = posts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleScreen(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(blurRadius: 10, color: Color(0x1aa5282FF)),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/posts/small/${post.imageFileName}",
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.caption,
                              style: const TextStyle(
                                fontFamily: FontFamily.avenir,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0xff376AED),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              post.title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 8, 32, 51),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Icon(
                                  CupertinoIcons.hand_thumbsup,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  post.likes,
                                  style: TextStyle(
                                    fontFamily: FontFamily.avenir,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Icon(
                                  CupertinoIcons.clock,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  post.time,
                                  style: const TextStyle(
                                    fontFamily: FontFamily.avenir,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: const MyClickableIcon(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
