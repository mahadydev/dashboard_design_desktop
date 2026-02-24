import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'widgets/s2_top_bar.dart';
import 'widgets/s2_sidebar.dart';
import 'widgets/s2_project_header.dart';
import 'widgets/s2_filter_bar.dart';
import 'widgets/s2_kanban_board.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.s2PageBg,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              // Top bar (full width, white)
              const S2TopBar(),
              const Divider(height: 1, thickness: 1, color: AppColors.s2Border),

              // Body: sidebar + content
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Floating icon sidebar
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: const S2Sidebar(),
                    ),

                    // Main content panel
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 20, 20, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Project title + tabs
                            const S2ProjectHeader(),
                            const SizedBox(height: 18),

                            // Filter / search bar
                            const S2FilterBar(),
                            const SizedBox(height: 16),

                            // Kanban board (scrollable)
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: const S2KanbanBoard(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
