import 'package:flutter/material.dart';
import 'package:interview_app/colors.dart';
import 'package:interview_app/screens/thankyou_screen.dart';
import 'package:interview_app/screens/widgets/button.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 24,
                left: 18,
                right: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "COMMENT (OPTIONAL)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.infoColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: TextField(
                      maxLength: 240,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.titleColor,
                      ),
                      decoration: InputDecoration.collapsed(
                        hintText: "WRITE YOUR REVIEW",
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: AppColors.infoColor.withOpacity(0.7),
                        ),
                      ),
                      scrollPadding: const EdgeInsets.all(20.0),
                      keyboardType: TextInputType.multiline,
                      maxLines: 99999,
                      autofocus: true,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              right: 24,
              left: 24,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "SKIP",
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Button(
                    label: "SUBMIT",
                    icon: Icons.check,
                    isDisabled: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ThankYouScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
