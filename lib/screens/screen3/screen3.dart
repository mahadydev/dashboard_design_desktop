import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import 'widgets/s3_center_feed.dart';
import 'widgets/s3_left_panel.dart';
import 'widgets/s3_right_panel.dart';
import 'widgets/s3_top_bar.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.s3PageBg,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.s3PageBg,
            borderRadius: BorderRadius.circular(18),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              // Top navigation bar
              const S3TopBar(),

              // Body: left panel + center feed + right panel
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Left panel
                    const S3LeftPanel(),

                    // Center feed (scrollable) — fixed width like Facebook
                    Expanded(
                      child: Container(
                        color: AppColors.s3PageBg,
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: 600,
                          child: const S3CenterFeed(),
                        ),
                      ),
                    ),

                    // Right panel
                    const S3RightPanel(),
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
