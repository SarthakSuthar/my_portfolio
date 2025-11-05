import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onEducationTap;
  final VoidCallback onProjectTap;
  final VoidCallback onContactTap;
  final String activeSection;

  const NavBar({
    super.key,
    required this.onAboutTap,
    required this.onExperienceTap,
    required this.onEducationTap,
    required this.onProjectTap,
    required this.onContactTap,
    required this.activeSection,
  });

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        // Show error to user
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: activeSection == "About"
            ? ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0)
            : ImageFilter.blur(
                sigmaX: 30.0,
                sigmaY: 30.0,
                tileMode: TileMode.clamp,
              ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            // color: activeSection == "About"
            //     ? Colors.transparent
            //     : AppColors.cardColor.withOpacity(0.15),
            // color: Colors.grey.withOpacity(0.1),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 700;
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (!isMobile)
                    Row(
                      children: [
                        githubButton(),
                        const SizedBox(width: 16),
                        navButton("About", onAboutTap),
                        navButton("Experience", onExperienceTap),
                        navButton("Education", onEducationTap),
                        navButton("Projects", onProjectTap),
                        navButton("Contact", onContactTap),
                      ],
                    )
                  else
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.menu),
                      onSelected: (value) {
                        switch (value) {
                          case "About":
                            onAboutTap();
                            break;
                          case "Experience":
                            onExperienceTap();
                            break;
                          case "Education":
                            onEducationTap();
                            break;
                          case "Projects":
                            onProjectTap();
                            break;
                          case "Contact":
                            onContactTap();
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: "About",
                          child: Text("About"),
                        ),
                        const PopupMenuItem(
                          value: "Experience",
                          child: Text("Experience"),
                        ),
                        const PopupMenuItem(
                          value: "Education",
                          child: Text("Education"),
                        ),
                        const PopupMenuItem(
                          value: "Projects",
                          child: Text("Projects"),
                        ),
                        const PopupMenuItem(
                          value: "Contact",
                          child: Text("Contact"),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget githubButton() {
    return InkWell(
      onTap: () => _launchURL('https://github.com/SarthakSuthar'),
      borderRadius: BorderRadius.circular(8),
      child: Image.asset("github_logo.png", height: 25),
    );
  }

  Widget navButton(String text, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: AppColors.textColor),
      ),
    );
  }
}
