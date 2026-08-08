import 'package:flutter/material.dart';
import 'app_theme.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isDarkMode ? const Color(0xFF121212) : JupiterTheme.background;

    final surfaceColor =
        isDarkMode ? const Color(0xFF1E1E1E) : JupiterTheme.surface;

    final primaryText =
        isDarkMode ? Colors.white : JupiterTheme.textPrimary;

    final secondaryText =
        isDarkMode ? Colors.white70 : JupiterTheme.textSecondary;

    final progressBackground =
        isDarkMode ? const Color(0xFF333333) : JupiterTheme.background;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back,",
                          style: TextStyle(
                            color: secondaryText,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.userName,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: primaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isDarkMode = !isDarkMode;
                            });
                          },
                          icon: Icon(
                            isDarkMode
                                ? Icons.light_mode
                                : Icons.dark_mode,
                            color: isDarkMode
                                ? Colors.amber
                                : JupiterTheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: JupiterTheme.primary,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      JupiterTheme.primary,
                      Color(0xFF4834D4),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: JupiterTheme.primary.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "NEXT LESSON",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Astrophysics & Orbital Mechanics",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Today at 4:00 PM • Live Studio 2",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "Enrolled Courses",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryText,
                ),
              ),
              const SizedBox(height: 16),
              _buildCourseCard(
                "Flutter Mobile Architectures",
                "12/16 Modules",
                0.75,
                Icons.flutter_dash,
                surfaceColor,
                primaryText,
                secondaryText,
                progressBackground,
              ),
              const SizedBox(height: 14),
              _buildCourseCard(
                "Data Structures & Algorithms",
                "4/20 Modules",
                0.20,
                Icons.code,
                surfaceColor,
                primaryText,
                secondaryText,
                progressBackground,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseCard(
    String title,
    String progressText,
    double progress,
    IconData icon,
    Color surfaceColor,
    Color primaryText,
    Color secondaryText,
    Color progressBackground,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: JupiterTheme.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: JupiterTheme.secondary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: primaryText,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  progressText,
                  style: TextStyle(
                    fontSize: 12,
                    color: secondaryText,
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: progressBackground,
                  color: JupiterTheme.accent,
                  minHeight: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

