import 'package:flutter/material.dart';
import 'package:practical_demo/utilities/app_colors.dart';
import 'package:practical_demo/utilities/app_styles.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({this.title, this.onPressed, super.key});

  final void Function()? onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        minimumSize: const Size(90, 30),
      ),
      child: Text(
        title ?? "",
        style: TextStyles().textStyle18Red,
      ),
    );
  }
}
