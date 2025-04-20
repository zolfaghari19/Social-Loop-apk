import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widget/navigation.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 28, 128, 210),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.grey.withOpacity(0.5))
          ],
        ),
        child: InkWell(
          onTap: () {
            showSnackBar(context, "Liked");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.thumbs.svg(),
              SizedBox(
                width: 8,
              ),
              Text(
                "2.1k",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                titleSpacing: 32,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
                title: Text("Article"),
                actions: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.more_horiz_rounded)),
                  SizedBox(
                    width: 16,
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Text(
                      "Digital World",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.stories.story9
                              .image(width: 52, height: 52, fit: BoxFit.cover),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Emilia",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 4),
                              Text("2m ago")
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showSnackBar(context, "Share is Clicked");
                            },
                            icon: Icon(
                              CupertinoIcons.share,
                              color: Color.fromARGB(255, 57, 81, 220),
                            )),
                        IconButton(
                            onPressed: () {
                              showSnackBar(context, "BookMark is Clicked");
                            },
                            icon: Icon(
                              CupertinoIcons.bookmark,
                              color: Color.fromARGB(255, 57, 81, 220),
                            )),
                      ],
                    ),
                  ),
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      child: Assets.background.singlePost.image()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text(
                      "Make Your Voice Heard in the Digital World!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: Text(
                      "In today’s digital world, your voice deserves to be heard. 📱📣\n"
                      "With just one post, you have the power to inspire, connect, and create change.\n"
                      "Social media isn't just a tool—it's a stage, and your message is the spotlight.\n"
                      "Whether you're building a brand, sharing a story, or promoting your passion,\n"
                      "let every word you share speak from the heart. ❤️\n"
                      "The likes, comments, and shares are more than numbers—they’re proof that your voice matters.\n"
                      "So grab that megaphone, step into the feed, and make some noise!\n"
                      "Your audience is waiting, and your moment is now. 🌟\n"
                      "Let’s turn followers into a community—one post at a time.",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MyAppNavigation(),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
