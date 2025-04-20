import 'package:flutter/material.dart';
import 'package:flutter_application/gen/assets.gen.dart';
import 'package:flutter_application/widget/data.dart';
import 'package:flutter_application/widget/details_posts.dart';
import 'package:flutter_application/widget/navigation.dart';
import 'package:flutter_application/widget/posts.dart';
import 'package:flutter_application/widget/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 15, 32, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, Ali Zolfagari!",
                    style: themeData.textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Material(
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: Assets.icons.notification.image(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
              child: Text(
                "Explore Today's",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const MyAppProfiles(),
            MyPostItem(
              category: AppDatabase.categories[0],
              post: AppDatabase.posts[0],
            ),
            MyAppdetailsPost(
              category: AppDatabase.categories[0],
              post: AppDatabase.posts[0],
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyAppNavigation(),
    );
  }
}
