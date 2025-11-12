import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/app_widget.dart';
import 'package:my_portfolio/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
                "// Contact me",
                style: TextStyle(color: AppColors.lightTextColor),
              ),

              Row(
                children: [
                  Text("Get in ", style: AppTheme.titleText),
                  gradientText("Touch"),
                ],
              ),

              Text(
                "Feel free to reach out to me",
                style: AppTheme.subtitleText,
              ),

              const SizedBox(height: 40),

              if (isMobile)
                Column(
                  children: [
                    Column(
                      children: [
                        ContactBox(
                          icon: Icons.email_outlined,
                          text: "Email",
                          url: "sarthaksuthar2804@gmail.com",
                          userName: "sarthaksuthar2804@gmail.com",
                        ),
                        const SizedBox(height: 20),
                        ContactBox(
                          icon: Icons.phone_outlined,
                          text: "Phone",
                          userName: "+91-91066 21689",
                          url: "+91-91066 21689",
                        ),
                        const SizedBox(height: 20),
                        ContactBox(
                          icon: Icons.person_outline,
                          text: "LinkedIn",
                          userName: "Sarthak Suthar",
                          url:
                              "https://www.linkedin.com/in/sarthak-suthar-33555b222/",
                        ),
                        const SizedBox(height: 20),
                        ContactBox(
                          icon: Icons.code,
                          text: "Github",
                          userName: "github.com/SarthakSuthar",
                          url: "https://github.com/SarthakSuthar",
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ContactBox(
                          icon: Icons.email_outlined,
                          text: "Email",
                          url: "sarthaksuthar2804@gmail.com",
                          userName: "sarthaksuthar2804@gmail.com",
                        ),
                        const SizedBox(height: 20),
                        ContactBox(
                          icon: Icons.phone_outlined,
                          text: "Phone",
                          userName: "+91-91066 21689",
                          url: "+91-91066 21689",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ContactBox(
                          icon: Icons.person_outline,
                          text: "LinkedIn",
                          userName: "Sarthak Suthar",
                          url:
                              "https://www.linkedin.com/in/sarthak-suthar-33555b222/",
                        ),
                        const SizedBox(height: 20),
                        ContactBox(
                          icon: Icons.code,
                          text: "Github",
                          userName: "github.com/SarthakSuthar",
                          url: "https://github.com/SarthakSuthar",
                        ),
                      ],
                    ),
                  ],
                ),

              SizedBox(height: isMobile ? 40 : 60),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactBox extends StatefulWidget {
  final IconData icon;
  final String text;
  final String userName;
  final String url;
  const ContactBox({
    super.key,
    required this.icon,
    required this.text,
    required this.url,
    required this.userName,
  });

  @override
  State<ContactBox> createState() => _ContactBoxState();
}

class _ContactBoxState extends State<ContactBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          _isHovered = value;
        });
      },
      onTap: () {
        if (widget.text == "Email") {
          // launchUrl(
          //   Uri.parse("mailto:${widget.url}"),
          //   mode: LaunchMode.externalApplication,
          // );
          if (kIsWeb) {
            launchUrl(
              Uri.parse(
                'https://mail.google.com/mail/?view=cm&fs=1&to=${widget.url}',
              ),
              mode: LaunchMode.externalApplication,
            );
          } else {
            launchUrl(
              Uri.parse('mailto:${widget.url}'),
              mode: LaunchMode.externalApplication,
            );
          }
        } else if (widget.text == "Phone") {
          launchUrl(
            Uri.parse("tel:${widget.url}"),
            mode: LaunchMode.externalApplication,
          );
        } else {
          launchUrl(Uri.parse(widget.url));
        }
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor2,
          border: Border.all(
            color: _isHovered
                ? AppColors.clipFillColor
                : AppColors.lightTextColor,
            width: _isHovered ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.clipFillColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.lightTextColor),
              ),
              child: Icon(widget.icon, color: AppColors.lightTextColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.text, style: AppTheme.subtitleText),
                  Text(widget.userName, style: AppTheme.bodyText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
