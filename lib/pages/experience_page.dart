import 'package:flutter/material.dart';
import 'package:my_portfolio/app_widget.dart';
import 'package:my_portfolio/theme.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          // minHeight: MediaQuery.of(context).size.height,
          maxWidth: 1200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "<experience>",
                style: TextStyle(color: AppColors.lightTextColor),
              ),

              Row(
                children: [
                  Text("Professional ", style: AppTheme.titleText),
                  gradientText("Experience"),
                ],
              ),

              Text(
                "Building impactful solutions across diverse industries",
                style: AppTheme.subtitleText,
              ),

              const SizedBox(height: 40),

              AppContainerWidget(
                context,
                title: "Flutter Developer",
                supportiveTitle: "Uniqtech Solutions",
                startDate: "April 2025",
                endDate: "Present",
                description: "Lorem ipsum dolor sit amet",
                clipsItems: ["Flutter", "Dart", "Firebase", "UI/UX"],
              ),

              const SizedBox(height: 20),

              AppContainerWidget(
                context,
                title: "Flutter Developer - Intern",
                supportiveTitle: "Uniqtech Solutions",
                startDate: "Nov 2024",
                endDate: "April 2025",
                description: "Lorem ipsum dolor sit amet",
                clipsItems: ["Flutter", "Dart", "Firebase", "UI/UX"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
