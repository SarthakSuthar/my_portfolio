import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/nav_bar.dart';
import 'package:my_portfolio/pages/about_page.dart';
import 'package:my_portfolio/pages/contact_page.dart';
import 'package:my_portfolio/pages/education_page.dart';
import 'package:my_portfolio/pages/experience_page.dart';
import 'package:my_portfolio/pages/project_page.dart';
import 'package:my_portfolio/theme.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(390, 844),
      builder: (_, child) => child!, // Remove MaterialApp from here
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sarthak Suthar',
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
  ScrollController _scrollController = ScrollController();

  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final educationKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  String _activeSection = "About";

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Get current scroll position
    final scrollPosition = _scrollController.offset;

    // Get positions of each section
    // final aboutPosition = _getWidgetPosition(aboutKey);
    final experiencePosition = _getWidgetPosition(experienceKey);
    final educationPosition = _getWidgetPosition(educationKey);
    final projectPosition = _getWidgetPosition(projectKey);
    final contactPosition = _getWidgetPosition(contactKey);

    // Determine which section is currently visible
    String newSection = "About";

    if (scrollPosition >= contactPosition - 100) {
      newSection = "Contact";
    } else if (scrollPosition >= projectPosition - 100) {
      newSection = "Projects";
    } else if (scrollPosition >= educationPosition - 100) {
      newSection = "Education";
    } else if (scrollPosition >= experiencePosition - 100) {
      newSection = "Experience";
    } else {
      newSection = "About";
    }

    // Update state only if section changed
    if (newSection != _activeSection) {
      setState(() {
        _activeSection = newSection;
      });
    }
  }

  double _getWidgetPosition(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      return position.dy + _scrollController.offset;
    }
    return 0.0;
  }

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
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AboutPage(
                  key: aboutKey,
                  projectPageKey: projectKey,
                  contactPageKey: contactKey,
                ),
                ExperiencePage(key: experienceKey),
                EducationPage(key: educationKey),
                ProjectPage(key: projectKey),
                ContactPage(key: contactKey),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onAboutTap: () => _scrollToSection(aboutKey, "About"),
              onExperienceTap: () =>
                  _scrollToSection(experienceKey, "Experience"),
              onEducationTap: () => _scrollToSection(educationKey, "Education"),
              onProjectTap: () => _scrollToSection(projectKey, "Projects"),
              onContactTap: () => _scrollToSection(contactKey, "Contact"),
              activeSection: _activeSection,
            ),
          ),
        ],
      ),
    );
  }
}
