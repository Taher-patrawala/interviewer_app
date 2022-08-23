import 'package:flutter/material.dart';
import 'package:interview_app/constants/colors.dart';
import 'package:interview_app/screens/ratings_screen.dart';

class Button extends StatelessWidget {
  final Function onTap;
  final bool isDisabled;
  final String label;
  final IconData icon;

  const Button({
    Key? key,
    required this.onTap,
    required this.isDisabled,
    this.label = "NEXT",
    this.icon = Icons.chevron_right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isDisabled) onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
            color:
                isDisabled ? AppColors.infoColor : AppColors.buttonBackground,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: isDisabled ? AppColors.dimGrey : Colors.white,
                  fontSize: 18),
            ),
            const SizedBox(width: 12),
            Icon(
              icon,
              color: isDisabled ? AppColors.dimGrey : Colors.white,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
