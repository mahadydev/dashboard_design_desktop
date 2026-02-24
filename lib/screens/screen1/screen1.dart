import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'widgets/sidebar.dart';
import 'widgets/welcome_banner.dart';
import 'widgets/task_card.dart';
import 'widgets/activities_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Floating sidebar with rounded corners
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const Sidebar(),
            ),
            const SizedBox(width: 16),

            // Main content area — white rounded card
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      // Top bar
                      const _TopBar(),

                      // Scrollable content
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(28, 8, 28, 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              WelcomeBanner(),
                              SizedBox(height: 28),
                              TasksSection(),
                              SizedBox(height: 28),
                              ActivitiesSection(),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Chat FAB
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 8),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.chatFab,
          elevation: 4,
          shape: const CircleBorder(),
          child: const Icon(Icons.chat_rounded, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          const Text('Dashboard', style: AppTextStyles.pageTitle),
          const Spacer(),
          const _SearchBar(),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.pageBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.searchBorder, width: 1),
      ),
      child: const Row(
        children: [
          SizedBox(width: 12),
          Icon(Icons.search_rounded, size: 18, color: AppColors.textSecondary),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(color: AppColors.textPrimary, fontSize: 13),
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
    );
  }
}
