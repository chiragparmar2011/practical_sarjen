import 'package:flutter/material.dart';
import 'package:practical_demo/utilities/app_colors.dart';

class TextStyles {
  TextStyle get textStyle18Red =>  TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.appBarColor,
        overflow: TextOverflow.ellipsis,
      );

  TextStyle get textStyle16Red => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.appBarColor,
        overflow: TextOverflow.ellipsis,
      );

  TextStyle get textStyle22Red =>  TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.appBarColor,
      );

  TextStyle get textStyle16Grey =>  TextStyle(
        fontSize: 16,
        color: AppColors.colorGrey,
      );

  TextStyle get textStyle16DarkGrey => const TextStyle(
        fontSize: 16,
        color: Colors.blueGrey,
      );

  TextStyle get textStyle14DarkGrey => const TextStyle(
        fontSize: 14,
        color: Colors.blueGrey,
      );

  TextStyle get textStyle16Black => const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      );

  TextStyle get textStyle14White => const TextStyle(
        fontSize: 14,
        color: Colors.white,
      );
}
