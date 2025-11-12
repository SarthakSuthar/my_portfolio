import 'package:flutter/material.dart';
import 'package:my_portfolio/app_widget.dart';
import 'package:my_portfolio/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                "const projects = [",
                style: TextStyle(color: AppColors.lightTextColor),
              ),

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

              const SizedBox(height: 20),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : 2,
                  childAspectRatio: 0.95,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
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

              const SizedBox(height: 20),
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
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, isHovered ? -8 : 0, 0),
        constraints: BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor2,
          borderRadius: BorderRadius.circular(10),
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
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
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

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: AppTheme.titleText.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: AppTheme.bodyText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: widget.techStack
                        .map((tech) => appClips(tech))
                        .toList(),
                  ),
                  const SizedBox(height: 30),
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
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
          ],
        ),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String? longDescription; // Add this for detailed description
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
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 600 ? 100 : 20,
        vertical: 40,
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 800,
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor2,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Stack(
          children: [
            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      project.title,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),

                    // Description
                    Text(
                      project.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                        height: 1.6,
                      ),
                    ),
                    // Image section
                    AspectRatio(
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

                    SizedBox(height: 32),

                    Text(
                      "About This Project",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 12),

                    Text(
                      project.longDescription ?? project.description,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[400],
                        height: 1.6,
                      ),
                    ),

                    SizedBox(height: 32),

                    // Technologies Used section
                    Text(
                      "Technologies Used",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 16),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: project.techStack.map((tech) {
                        return appClips(tech);
                      }).toList(),
                    ),

                    SizedBox(height: 32),

                    // Action buttons
                    Row(
                      children: [
                        // View Code button
                        if (project.githubUrl != null)
                          Expanded(
                            child: InkWell(
                              onTap: () => _launchURL(project.githubUrl!),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
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
                                        fontSize: 16,
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
                          SizedBox(width: 16),

                        // Download/Live Demo button
                        if (project.liveUrl != null)
                          Expanded(
                            child: InkWell(
                              onTap: () => _launchURL(project.liveUrl!),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
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
                                        fontSize: 16,
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

                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Close button (X)
            Positioned(
              top: 16,
              right: 16,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    // color: Color(0xFF00D9A3),
                    border: Border.all(color: AppColors.lightTextColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.close, color: Colors.white, size: 20),
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
