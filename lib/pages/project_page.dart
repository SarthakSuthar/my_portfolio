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
        title: "E-Commerce Mobile App",
        description:
            "A full-featured e-commerce application with cart management, payment integration, and user authentication built using Flutter.",
        imagePath: "assets/my_profile_img.png",
        techStack: ["Flutter", "Firebase", "Stripe", "Provider"],
        githubUrl: "https://github.com/yourusername/ecommerce-app",
        liveUrl: null,
      ),
      Project(
        title: "Weather Forecast App",
        description:
            "Real-time weather application with 7-day forecasts, location-based weather updates, and beautiful animated UI.",
        imagePath: "assets/my_profile_img.png",
        techStack: ["Flutter", "REST API", "Bloc", "Geolocator"],
        githubUrl: "https://github.com/yourusername/weather-app",
        liveUrl: "https://yourweatherapp.com",
      ),
      Project(
        title: "Task Management Dashboard",
        description:
            "Productivity app with task tracking, project management, team collaboration features, and real-time synchronization.",
        imagePath: "assets/my_profile_img.png",
        techStack: ["Flutter", "Firebase", "GetX", "Hive"],
        githubUrl: "https://github.com/yourusername/task-manager",
        liveUrl: null,
      ),
      Project(
        title: "Social Media App",
        description:
            "Modern social networking platform with real-time messaging, media sharing, and content moderation.",
        longDescription:
            "A full-featured social media application built with React Native. Includes user profiles, post creation with image/video support, real-time messaging system, news feed with infinite scroll, like and comment functionality, content moderation tools, push notifications, and social sharing capabilities.",
        imagePath: "assets/my_profile_img.png",
        techStack: ["React Native", "GraphQL", "AWS", "Redis"],
        githubUrl: "https://github.com/yourusername/social-media-app",
        liveUrl: "https://yoursocialmediaapp.com/download",
      ),
      Project(
        title: "Fitness Tracker",
        description:
            "Health and fitness app with workout tracking, calorie counting, progress charts, and personalized workout plans.",
        imagePath: "assets/my_profile_img.png",
        techStack: ["Flutter", "SQLite", "Charts", "Sensors"],
        githubUrl: "https://github.com/yourusername/fitness-tracker",
        liveUrl: "https://yourfitnessapp.com",
      ),
      Project(
        title: "Restaurant Booking App",
        description:
            "Reservation system with table booking, menu browsing, order placement, and real-time availability updates.",
        imagePath: "assets/my_profile_img.png",
        techStack: ["Flutter", "Node.js", "MongoDB", "Google Maps"],
        githubUrl: "https://github.com/yourusername/restaurant-booking",
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
                              title: "title",
                              description: "description",
                              imagePath: "imagePath",
                              longDescription: "longDescription",
                              techStack: ["techStack"],
                              githubUrl: "githubUrl",
                              liveUrl: "liveUrl",
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
