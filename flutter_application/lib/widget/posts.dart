import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/widget/data.dart';

class MyPostItem extends StatelessWidget {
  final Category category;

  const MyPostItem({
    super.key,
    required this.category, required PostData post,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;

    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        final currentCategory = categories[index];

        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/posts/large/${currentCategory.imageFileName}"),
                    fit: BoxFit.cover,
                  ),
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [Color(0xff0D253C), Colors.transparent],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 47,
              left: 50,
              child: Text(
                currentCategory.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: Colors.white),
              ),
            )
          ],
        );
      },
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.80,
        aspectRatio: 1.2,
        initialPage: 0,
        scrollPhysics: BouncingScrollPhysics(),
        disableCenter: true,
        enableInfiniteScroll: false,
      ),
    );
  }
}
