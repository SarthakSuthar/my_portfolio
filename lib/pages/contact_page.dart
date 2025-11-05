import 'package:flutter/material.dart';
import 'package:my_portfolio/app_widget.dart';
import 'package:my_portfolio/theme.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1200),
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
                          Icons.email_outlined,
                          "Email",
                          "sarthaksuthar2804@gmail.com",
                        ),
                        const SizedBox(height: 20),
                        ContactBox(
                          Icons.phone_outlined,
                          "Phone",
                          "+91-91066 21689",
                        ),
                        const SizedBox(height: 20),
                        ContactBox(
                          Icons.person_outline,
                          "LinkedIn",
                          "Sarthak Suthar",
                        ),
                        const SizedBox(height: 20),
                        ContactBox(
                          Icons.code,
                          "Github",
                          "github.com/SarthakSuthar",
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
                          Icons.email_outlined,
                          "Email",
                          "sarthaksuthar2804@gmail.com",
                        ),
                        const SizedBox(height: 20),
                        ContactBox(
                          Icons.phone_outlined,
                          "Phone",
                          "+91-91066 21689",
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ContactBox(
                          Icons.person_outline,
                          "LinkedIn",
                          "Sarthak Suthar",
                        ),
                        const SizedBox(height: 20),
                        ContactBox(
                          Icons.code,
                          "Github",
                          "github.com/SarthakSuthar",
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
  final String url;
  const ContactBox(this.icon, this.text, this.url, {super.key});

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
      onTap: () {},
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
                  Text(widget.url, style: AppTheme.bodyText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
