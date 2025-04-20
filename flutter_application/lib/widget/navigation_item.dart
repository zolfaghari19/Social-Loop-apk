import 'package:flutter/material.dart';
import 'package:flutter_application/gen/fonts.gen.dart';

class MyAppNavigationItem extends StatelessWidget {
  const MyAppNavigationItem({
    super.key,
    required this.iconFileName,
    required this.activeIconFileName,
    required this.title,
    required this.isSelected,
  });

  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final bool isSelected; 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/icons/${isSelected ? activeIconFileName : iconFileName}",
          width: 24,
          height: 24,
          fit: BoxFit.contain,
          color: isSelected ? Colors.blue : null,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: isSelected ? Colors.blue : const Color(0xff788882),
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
