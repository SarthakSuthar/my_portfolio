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
          maxWidth: 1000,
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
                description:
                    "I have worked on many different project and accquired real world experience through different projects. Here my day-to-day tasks involved development, and meeting with clients to understand the requirements.",
                clipsItems: [
                  "Bloc",
                  "State Management",
                  "GetX",
                  "Responsive Web App",
                  "Firebase",
                  "Local Database",
                ],
              ),

              const SizedBox(height: 20),

              AppContainerWidget(
                context,
                title: "Flutter Developer - Intern",
                supportiveTitle: "Uniqtech Solutions",
                startDate: "Nov 2024",
                endDate: "March 2025",
                description:
                    "Started my professional carrear here and worked with Flutter on real world project.",
                clipsItems: ["Flutter", "Dart", "Android", "UI/UX", "REST API"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
