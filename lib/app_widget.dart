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
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    // bool isDesktop = screenWidth >= 1024;

    // Responsive values
    double horizontalPadding = isMobile ? 12 : (isTablet ? 16 : 20);
    double verticalPadding = isMobile ? 20 : (isTablet ? 24 : 26);
    double borderRadius = isMobile ? 8 : 10;
    double stripWidth = _isHovered ? (isMobile ? 5 : 6) : (isMobile ? 4 : 5);
    double iconSize = isMobile ? 16 : 18;
    double dateIconSize = isMobile ? 12 : 14;
    double spacing = isMobile ? 12 : 16;
    double wrapSpacing = isMobile ? 6 : 8;
    double wrapRunSpacing = isMobile ? 6 : 8;
    int descriptionMaxLines = isMobile ? 3 : 4;

    return InkWell(
      onHover: (value) {
        setState(() {
          _isHovered = value;
        });
      },
      onTap: () {},
      borderRadius: BorderRadius.circular(borderRadius),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor2,
          borderRadius: BorderRadius.circular(borderRadius),
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
                width: stripWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    bottomLeft: Radius.circular(borderRadius),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.lightTextColor, AppColors.clipFillColor],
                  ),
                ),
              ),

              SizedBox(width: spacing),

              // Body
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: verticalPadding,
                    horizontal: horizontalPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isMobile)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: _isHovered
                                  ? AppTheme.titleGreenText
                                  : AppTheme.titleText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(height: wrapSpacing),
                            _buildDateChip(
                              "${widget.startDate} - ${widget.endDate}",
                              dateIconSize,
                            ),
                          ],
                        )
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                widget.title,
                                style: _isHovered
                                    ? AppTheme.titleGreenText
                                    : AppTheme.titleText,
                                overflow: TextOverflow.ellipsis,
                                maxLines: isTablet ? 2 : 1,
                              ),
                            ),
                            SizedBox(width: spacing),
                            _buildDateChip(
                              "${widget.startDate} - ${widget.endDate}",
                              dateIconSize,
                            ),
                          ],
                        ),

                      SizedBox(height: spacing),

                      // Company
                      Row(
                        children: [
                          Icon(
                            widget.isEducation
                                ? Icons.school_outlined
                                : Icons.work_outline,
                            color: AppColors.textColor,
                            size: iconSize,
                          ),
                          SizedBox(width: wrapSpacing),
                          Expanded(
                            child: Text(
                              widget.supportiveTitle,
                              style: AppTheme.subtitleText,
                              overflow: TextOverflow.ellipsis,
                              maxLines: isMobile ? 2 : 1,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: spacing),

                      // Description
                      Text(
                        widget.description,
                        style: AppTheme.bodyText,
                        maxLines: descriptionMaxLines,
                        overflow: TextOverflow.ellipsis,
                      ),

                      SizedBox(height: spacing),

                      // Skills/Tags
                      Wrap(
                        spacing: wrapSpacing,
                        runSpacing: wrapRunSpacing,
                        children: [
                          for (String val in widget.clipsItems) appClips(val),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: spacing),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateChip(String dateText, double iconSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    double horizontalPadding = isMobile ? 10 : 12;
    double verticalPadding = isMobile ? 5 : 6;
    double fontSize = isMobile ? 11 : 12;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
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
            size: iconSize,
          ),
          const SizedBox(width: 6),
          Text(
            dateText,
            style: AppTheme.subtitleText.copyWith(fontSize: fontSize),
          ),
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
