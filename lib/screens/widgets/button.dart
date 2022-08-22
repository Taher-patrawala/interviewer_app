import 'package:flutter/material.dart';
import 'package:interview_app/colors.dart';
import 'package:interview_app/screens/ratings_screen.dart';

class Button extends StatelessWidget {
  final Function onTap;
  final bool isDisabled;

  const Button({
    Key? key,
    required this.onTap,
    required this.isDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isDisabled) onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        decoration: BoxDecoration(
            color: isDisabled?AppColors.infoColor:AppColors.buttonBackground,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Next",
              style: TextStyle(
                  color: isDisabled ? AppColors.dimGrey : Colors.white,
                  fontSize: 18),
            ),
            Icon(
              Icons.chevron_right,
              color: isDisabled ? AppColors.dimGrey : Colors.white,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
