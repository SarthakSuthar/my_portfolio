import 'package:flutter/material.dart';
import 'package:my_portfolio/app_widget.dart';
import 'package:my_portfolio/theme.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1000),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "<education>",
                style: TextStyle(color: AppColors.lightTextColor),
              ),

              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Education ", style: AppTheme.titleText),
                    gradientText("Background"),
                  ],
                )
              else
                Row(
                  children: [
                    Text("Education ", style: AppTheme.titleText),
                    gradientText("Background"),
                  ],
                ),

              Text(
                "Building a strong foundation in computer science",
                style: AppTheme.subtitleText,
              ),

              const SizedBox(height: 40),

              AppContainerWidget(
                context,
                title: "Bachelor of Software Engineering",
                supportiveTitle: "Parul University",
                startDate: "2021",
                endDate: "2025",
                description:
                    "Focused on software development, algorithms, and database systems. ",
                clipsItems: ["programming", "database", "Software Development"],
                isEducation: true,
              ),

              const SizedBox(height: 20),

              AppContainerWidget(
                context,
                title: "PCM",
                supportiveTitle: "Jawahar Navodaya Vidayalaya",
                startDate: "2019",
                endDate: "2021",
                description:
                    "Learned fundaments in core subjects and python in computer science subject",
                clipsItems: [
                  "Physics",
                  "Chemistry",
                  "Maths",
                  "Computer Science",
                ],
                isEducation: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
