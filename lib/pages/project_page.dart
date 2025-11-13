import 'package:flutter/material.dart';
import 'package:my_portfolio/app_widget.dart';
import 'package:my_portfolio/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isDesktop = screenWidth >= 1024;

    // Responsive values
    double horizontalPadding = isMobile ? 16 : (isTablet ? 24 : 32);
    double verticalPadding = isMobile ? 16 : 20;
    double spacing = isMobile ? 16 : 20;
    int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 2);
    double childAspectRatio = isMobile
        ? 0.85
        : (isTablet ? 0.80 : 0.85); // Increased height
    double gridSpacing = isMobile ? 12 : 16;

    // Create this as a global variable or inside your ProjectPage class
    final List<Project> projects = [
      Project(
        title: "Employee Self Service",
        description: "An HRMS ESS mobile app to digitalize manual HR tasks.",
        longDescription:
            "Worked on a HRMS ESS mobile application to deliver seamlesss user experience. I consisted modules like attendance, leav e management, finance, bookings and ticket generation, all with the multilevel approval system.",
        imagePath: "assets/ess.png",
        techStack: [
          "Flutter",
          "FCM",
          "REST API",
          "BLoC",
          "Provider",
          "Shared-Preferences",
        ],
        githubUrl: null,
        liveUrl:
            "https://play.google.com/store/apps/details?id=com.dhyey.mitconess&pcampaignid=web_share",
      ),
      Project(
        title: "Dicabs CRM",
        description: "CRM application with real time location tracking.",
        longDescription:
            "In this project I specifically worked on tracking location feature. In this I have implemented robust real-time location tracking of employee device to check employee activities.",
        imagePath: "assets/dicabs_crm.png",
        techStack: ["Flutter", "REST API", "GetX", "Geo-Location"],
        githubUrl: null,
        liveUrl:
            "https://play.google.com/store/apps/details?id=com.uniqtech.dicabs&pcampaignid=web_share",
      ),
      Project(
        title: "Customer Relationship Management",
        description:
            "It is a web and mobile (cross-platform) application, designed for employees to maintain track records.",
        longDescription:
            "I have created a mobile and web app to maintain customer relationship records. I uses Flutter for crossplatform support. I used Firebase aas my primary database (as it is offline first app) and auth provider. for state management and routing I used Getx.",
        imagePath: "crm.png",
        techStack: ["Flutter", "Firebase", "SQLite", "GetX"],
        githubUrl: "https://github.com/SarthakSuthar/uniqtech_crm",
        liveUrl: "http://uniqtech-001-site10.ntempurl.com/#/login",
      ),
      Project(
        title: "Portfolio Website",
        description: "Web page created to showcase my own work and skills.",
        longDescription:
            "I have created this entire portfolio in Flutter only and deployed it on Github page. (So this is the live demo itself 😁)",
        imagePath: "portfolio.png",
        techStack: ["Flutter", "Github web pages"],
        githubUrl: "https://github.com/SarthakSuthar/my_portfolio",
        liveUrl: null,
      ),
    ];

    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isDesktop ? 1000 : double.infinity,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "const projects = [",
                style: TextStyle(color: AppColors.lightTextColor),
              ),

              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Featured ", style: AppTheme.titleText),
                    gradientText("Projects"),
                  ],
                )
              else
                Row(
                  children: [
                    Text("Featured ", style: AppTheme.titleText),
                    gradientText("Projects"),
                  ],
                ),

              Text(
                "A selection of my recent work showcasing solutions",
                style: AppTheme.subtitleText,
              ),

              SizedBox(height: spacing),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  crossAxisSpacing: gridSpacing,
                  mainAxisSpacing: gridSpacing,
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(
                    title: projects[index].title,
                    description: projects[index].description,
                    imagePath: projects[index].imagePath,
                    techStack: projects[index].techStack,
                    longDescription: projects[index].longDescription,
                    githubUrl: projects[index].githubUrl,
                    liveUrl: projects[index].liveUrl,
                  );
                },
              ),

              SizedBox(height: spacing),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> techStack;
  final String? longDescription;
  final String? githubUrl;
  final String? liveUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.techStack,
    this.longDescription,
    this.githubUrl,
    this.liveUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define responsive values
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;

    double borderRadius = isMobile ? 8 : 10;
    double contentPadding = isMobile ? 10 : 14; // Reduced from 12:16
    double titleFontSize = isMobile ? 17 : 19; // Reduced from 18:20
    double spacing = isMobile ? 6 : 8; // Reduced from 8:10
    double wrapSpacing = isMobile ? 4 : 5; // Reduced from 5:6
    double buttonVerticalPadding = isMobile ? 5 : 7; // Reduced from 6:8
    double buttonHorizontalPadding = isMobile ? 10 : 14; // Reduced from 12:16

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
        constraints: BoxConstraints(maxWidth: isTablet ? 450 : 500),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor2,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isHovered ? Color(0xFF24C76D) : AppColors.lightTextColor,
            width: isHovered ? 1.5 : 0.2,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Color(0xFF24C76D).withOpacity(0.3),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Flexible(
              flex: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    if (isHovered)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.4),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Content section
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: AppTheme.titleText.copyWith(
                        fontSize: titleFontSize,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: spacing),
                    Text(
                      widget.description,
                      style: AppTheme.bodyText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: spacing),
                    Wrap(
                      spacing: wrapSpacing,
                      runSpacing: wrapSpacing,
                      children: widget.techStack
                          .map((tech) => appClips(tech))
                          .toList(),
                    ),
                    Spacer(), // Push button to bottom
                    SizedBox(height: spacing),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ProjectDetailsPopUp(
                              project: Project(
                                title: widget.title,
                                description: widget.description,
                                imagePath: widget.imagePath,
                                longDescription: widget.longDescription,
                                techStack: widget.techStack,
                                githubUrl: widget.githubUrl,
                                liveUrl: widget.liveUrl,
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF24C76D), Color(0xFF27D9B5)],
                          ),
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: buttonHorizontalPadding,
                            vertical: buttonVerticalPadding,
                          ),
                          child: Center(
                            child: Text(
                              "View Details",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String? longDescription;
  final String imagePath;
  final List<String> techStack;
  final String? githubUrl;
  final String? liveUrl;

  Project({
    required this.title,
    required this.description,
    this.longDescription,
    required this.imagePath,
    required this.techStack,
    this.githubUrl,
    this.liveUrl,
  });
}

class ProjectDetailsPopUp extends StatelessWidget {
  final Project project;

  const ProjectDetailsPopUp({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define breakpoints
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isDesktop = screenWidth >= 1024;

    // Responsive values
    double horizontalInset = isMobile ? 16 : (isTablet ? 60 : 100);
    double verticalInset = isMobile ? 30 : 40;
    double maxWidth = isDesktop ? 800 : double.infinity;
    double borderRadius = isMobile ? 16 : 20;
    double contentPadding = isMobile ? 20 : 32;
    double titleFontSize = isMobile ? 24 : 32;
    double subtitleFontSize = isMobile ? 14 : 16;
    double sectionTitleFontSize = isMobile ? 18 : 22;
    double bodyFontSize = isMobile ? 14 : 15;
    double spacing = isMobile ? 20 : 32;
    double smallSpacing = isMobile ? 10 : 12;
    double wrapSpacing = isMobile ? 8 : 10;
    double buttonPadding = isMobile ? 12 : 16;
    double buttonSpacing = isMobile ? 12 : 16;
    double closeButtonSize = isMobile ? 18 : 20;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: horizontalInset,
        vertical: verticalInset,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: screenHeight * 0.9,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor2,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Stack(
          children: [
            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      project.title,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),

                    // Description
                    Text(
                      project.description,
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        color: Colors.grey[400],
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: spacing),

                    // Image section
                    ClipRRect(
                      borderRadius: BorderRadius.circular(isMobile ? 8 : 10),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.asset(
                          project.imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[800],
                              child: Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: spacing),

                    Text(
                      "About This Project",
                      style: TextStyle(
                        fontSize: sectionTitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: smallSpacing),

                    Text(
                      project.longDescription ?? project.description,
                      style: TextStyle(
                        fontSize: bodyFontSize,
                        color: Colors.grey[400],
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: spacing),

                    // Technologies Used section
                    Text(
                      "Technologies Used",
                      style: TextStyle(
                        fontSize: sectionTitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: smallSpacing),

                    Wrap(
                      spacing: wrapSpacing,
                      runSpacing: wrapSpacing,
                      children: project.techStack.map((tech) {
                        return appClips(tech);
                      }).toList(),
                    ),

                    SizedBox(height: spacing),

                    // Action buttons
                    if (isMobile)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (project.githubUrl != null)
                            InkWell(
                              onTap: () => _launchURL(project.githubUrl!),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: buttonPadding,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFF252835),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.code,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "View Code",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: bodyFontSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          if (project.githubUrl != null &&
                              project.liveUrl != null)
                            SizedBox(height: buttonSpacing),

                          if (project.liveUrl != null)
                            InkWell(
                              onTap: () => _launchURL(project.liveUrl!),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: buttonPadding,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF00D9A3),
                                      Color(0xFF00B589),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.download,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Download App",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: bodyFontSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          // View Code button
                          if (project.githubUrl != null)
                            Expanded(
                              child: InkWell(
                                onTap: () => _launchURL(project.githubUrl!),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: buttonPadding,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF252835),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.1),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.code,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "View Code",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: bodyFontSize,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          if (project.githubUrl != null &&
                              project.liveUrl != null)
                            SizedBox(width: buttonSpacing),

                          // Download/Live Demo button
                          if (project.liveUrl != null)
                            Expanded(
                              child: InkWell(
                                onTap: () => _launchURL(project.liveUrl!),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: buttonPadding,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF00D9A3),
                                        Color(0xFF00B589),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.download,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Download App",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: bodyFontSize,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),

                    SizedBox(height: buttonSpacing),
                  ],
                ),
              ),
            ),

            // Close button (X)
            Positioned(
              top: isMobile ? 12 : 16,
              right: isMobile ? 12 : 16,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: EdgeInsets.all(isMobile ? 3 : 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightTextColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: closeButtonSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
