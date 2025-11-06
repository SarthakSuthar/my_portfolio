import 'package:flutter/material.dart';
import 'package:my_portfolio/app_widget.dart';
import 'package:my_portfolio/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
    required this.projectPageKey,
    required this.contactPageKey,
  });
  final GlobalKey projectPageKey;
  final GlobalKey contactPageKey;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;

    return Stack(
      children: [
        Positioned.fill(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black38.withOpacity(
                0.6,
              ), // Adjust 0.5 (0.0-1.0) for darkness
              BlendMode.darken,
            ),
            child: Image.asset("home_bg.png", fit: BoxFit.cover),
          ),
        ),
        Center(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              maxWidth: 1000,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: AppColors.backgroundColor2,
                      boxShadow: [
                        // Outer shadow (larger, lighter)
                        BoxShadow(
                          color: AppColors.lightTextColor.withOpacity(0.2),
                          spreadRadius: 8,
                          blurRadius: 20,
                          offset: Offset(0, 0),
                        ),
                        // Inner shadow (smaller, darker)
                        BoxShadow(
                          color: AppColors.lightTextColor.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.backgroundColor2,
                      backgroundImage: AssetImage("my_profile_img.png"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  appClips("Flutter Developer"),
                  const SizedBox(height: 20),
                  if (isMobile)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, I'm ", style: AppTheme.titleText),
                        gradientText("Sarthak Suthar"),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Text("Hi, I'm ", style: AppTheme.titleText),
                        gradientText("Sarthak Suthar"),
                      ],
                    ),
                  const SizedBox(height: 10),
                  Text(
                    "A passionate mobile application developer having experience in building cross-platform applications using Flutter and Dart.",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (isMobile)
                    Column(
                      children: [
                        viewMyWorkBtn(projectPageKey),
                        const SizedBox(height: 10),
                        getInTouchBtn(contactPageKey),
                      ],
                    )
                  else
                    Row(
                      children: [
                        viewMyWorkBtn(projectPageKey),
                        const SizedBox(width: 10),
                        getInTouchBtn(contactPageKey),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget viewMyWorkBtn(GlobalKey pageKey) {
    return InkWell(
      onTap: () {
        Scrollable.ensureVisible(
          projectPageKey.currentContext!,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF24C76D), Color(0xFF27D9B5)],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text("View My Work"),
        ),
      ),
    );
  }

  Widget getInTouchBtn(GlobalKey contactPageKey) {
    return InkWell(
      onTap: () {
        Scrollable.ensureVisible(
          contactPageKey.currentContext!,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text("Get In Touch", style: AppTheme.bodyText),
        ),
      ),
    );
  }
}
