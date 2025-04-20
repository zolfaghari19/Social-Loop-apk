import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyClickableIcon extends StatefulWidget {
  const MyClickableIcon({super.key});

  @override
  _MyClickableIconState createState() => _MyClickableIconState();
}

class _MyClickableIconState extends State<MyClickableIcon> {
  bool isBookmarked = false; // وضعیت بوکمارک

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isBookmarked = !isBookmarked; // تغییر وضعیت
          });
        },
        child: Icon(
          isBookmarked
              ? CupertinoIcons.bookmark_fill // آیکون پر شده
              : CupertinoIcons.bookmark, // آیکون خالی
          size: 16,
          color: isBookmarked ? Colors.black : const Color.fromARGB(255, 0, 0, 0), // تغییر رنگ
        ),
      ),
    );
  }
}
