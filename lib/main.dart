import 'package:flutter/material.dart';
import 'package:my_portfolio/nav_bar.dart';
import 'package:my_portfolio/pages/about_page.dart';
import 'package:my_portfolio/pages/contact_page.dart';
import 'package:my_portfolio/pages/education_page.dart';
import 'package:my_portfolio/pages/experience_page.dart';
import 'package:my_portfolio/pages/project_page.dart';
import 'package:my_portfolio/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      theme: AppTheme.themeData,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final educationKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  String _activeSection = "About";

  void _scrollToSection(GlobalKey key, String section) {
    setState(() => _activeSection = section);

    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(
            onAboutTap: () => _scrollToSection(aboutKey, "About"),
            onExperienceTap: () =>
                _scrollToSection(experienceKey, "Experience"),
            onEducationTap: () => _scrollToSection(educationKey, "Education"),
            onProjectTap: () => _scrollToSection(projectKey, "Projects"),
            onContactTap: () => _scrollToSection(contactKey, "Contact"),
            activeSection: _activeSection,
          ),

          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AboutPage(key: aboutKey),
                  ExperiencePage(key: experienceKey),
                  EducationPage(key: educationKey),
                  ProjectPage(key: projectKey),
                  ContactPage(key: contactKey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
