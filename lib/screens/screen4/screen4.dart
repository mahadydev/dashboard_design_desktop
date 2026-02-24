import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import 'widgets/s4_center_content.dart';
import 'widgets/s4_right_panel.dart';
import 'widgets/s4_sidebar.dart';
import 'widgets/s4_top_bar.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.s4PageBg,
      body: Column(
        children: [
          // Top bar spans full width
          Container(
            decoration: BoxDecoration(
              color: AppColors.s4TopBarBg,
              border: const Border(
                bottom: BorderSide(color: AppColors.s4Border),
              ),
            ),
            child: Row(
              children: [
                // Sidebar logo area aligns with sidebar width
                const SizedBox(width: 220),
                Container(width: 1, height: 64, color: AppColors.s4Border),
                const Expanded(child: S4TopBar()),
              ],
            ),
          ),
          // Main body
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left sidebar
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.s4SidebarBg,
                    border: Border(
                      right: BorderSide(color: AppColors.s4Border),
                    ),
                  ),
                  child: const S4Sidebar(),
                ),
                // Center scrollable content
                const Expanded(child: S4CenterContent()),
                // Right panel
                Container(
                  decoration: const BoxDecoration(
                    border: Border(left: BorderSide(color: AppColors.s4Border)),
                  ),
                  child: const S4RightPanel(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
