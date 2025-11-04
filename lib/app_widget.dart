import 'package:flutter/material.dart';
import 'package:my_portfolio/theme.dart';

class AppContainerWidget extends StatefulWidget {
  final String title;
  final String supportiveTitle;
  final String startDate;
  final String endDate;
  final String description;
  final List<String> clipsItems;
  final bool isEducation;

  const AppContainerWidget(
    BuildContext context, {
    super.key,
    required this.title,
    required this.supportiveTitle,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.clipsItems,
    this.isEducation = false,
  });

  @override
  State<AppContainerWidget> createState() => _AppContainerWidgetState();
}

class _AppContainerWidgetState extends State<AppContainerWidget> {
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor2,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _isHovered
                ? AppColors.clipFillColor
                : AppColors.lightTextColor,
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.clipFillColor.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Gradient strip
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: _isHovered ? 6 : 5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.lightTextColor, AppColors.clipFillColor],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Body
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 26,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.title,
                              style: _isHovered
                                  ? AppTheme.titleGreenText
                                  : AppTheme.titleText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                          _buildDateChip(
                            "${widget.startDate} - ${widget.endDate}",
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Company
                      Row(
                        children: [
                          Icon(
                            widget.isEducation
                                ? Icons.school_outlined
                                : Icons.work_outline,
                            color: AppColors.textColor,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              widget.supportiveTitle,
                              style: AppTheme.subtitleText,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Description
                      Text(
                        widget.description,
                        style: AppTheme.bodyText,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 16),

                      // Skills/Tags
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (String val in widget.clipsItems) appClips(val),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateChip(String dateText) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _isHovered
            ? AppColors.clipFillColor.withOpacity(0.15)
            : AppColors.lightTextColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            color: AppColors.textColor,
            size: 14,
          ),
          const SizedBox(width: 6),
          Text(dateText, style: AppTheme.subtitleText.copyWith(fontSize: 12)),
        ],
      ),
    );
  }
}

Widget appClips(String text) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.lightTextColor),
      color: AppColors.clipFillColor,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(text, style: AppTheme.clipText),
    ),
  );
}

Widget gradientText(String text) {
  return ShaderMask(
    shaderCallback: (bounds) {
      return const LinearGradient(
        colors: [Color(0xFF24C76D), Color(0xFF27D9B5)],
      ).createShader(bounds);
    },
    child: Text(
      text,
      style: AppTheme.titleText,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
