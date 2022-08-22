import 'package:flutter/material.dart';
import 'package:interview_app/colors.dart';
import 'package:interview_app/screens/interviewer_selection_screen.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/lamp.png",
              scale: 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "THANK YOU !",
                    style: TextStyle(
                        fontSize: 32,
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.w800,
                        height: 1.5),
                  ),
                  Text(
                    "We have taken your feedback.\nWe are glad that you felt your interview is Awesome!",
                    style: TextStyle(
                      fontSize: 24,
                      height: 1.5,
                      color: AppColors.titleColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const InterviewerSelection()));
                  },
                  child: Text(
                    "HOME",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/plant.png",
                  scale: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
