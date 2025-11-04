import 'package:flutter/material.dart';
import 'package:my_portfolio/app_widget.dart';
import 'package:my_portfolio/theme.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "// Contact me",
                style: TextStyle(color: AppColors.lightTextColor),
              ),

              Row(
                children: [
                  Text("Get in ", style: AppTheme.titleText),
                  gradientText("Touch"),
                ],
              ),

              Text(
                "Feel free to reach out to me",
                style: AppTheme.subtitleText,
              ),

              const SizedBox(height: 40),

              Row(
                children: [
                  Column(
                    children: [
                      contactBox(
                        Icons.email_outlined,
                        "Email",
                        "sarthaksuthar2804@gmail.com",
                      ),
                      const SizedBox(height: 20),
                      contactBox(
                        Icons.phone_outlined,
                        "Phone",
                        "+91-91066 21689",
                      ),
                      const SizedBox(height: 20),
                      contactBox(
                        Icons.person_outline,
                        "LinkedIn",
                        "Sarthak Suthar",
                      ),
                    ],
                  ),

                  Container(
                    width: 400,
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Your Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Your Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Your Message",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactBox(IconData icon, String text, String url) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor2,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.clipFillColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.lightTextColor),
              ),
              child: Icon(icon, color: AppColors.lightTextColor),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: AppTheme.subtitleText),
                Text(url, style: AppTheme.bodyText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
