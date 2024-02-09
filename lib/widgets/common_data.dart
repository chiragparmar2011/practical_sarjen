import 'package:flutter/material.dart';
import 'package:practical_demo/utilities/app_styles.dart';

class CommonData extends StatelessWidget {
  const CommonData({required this.title, required this.desc, super.key});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles().textStyle14DarkGrey,
          overflow: TextOverflow.visible,
        ),
        Text(
          desc,
          style: TextStyles().textStyle16Red,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
