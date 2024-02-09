import 'package:flutter/material.dart';
import 'package:practical_demo/utilities/app_colors.dart';

class CommonOption extends StatelessWidget {
  const CommonOption({required this.onPressed, required this.icon, super.key});

  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 38,
      decoration: BoxDecoration(
        color: AppColors.headerColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: AppColors.whiteColor,
      ),
    );
  }
}
