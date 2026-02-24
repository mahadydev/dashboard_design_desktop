import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class S2TopBar extends StatelessWidget {
  const S2TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Logo
          _Logo(),
          const SizedBox(width: 32),

          // Search bar (center, flexible)
          Expanded(child: Center(child: _SearchBar())),
          const SizedBox(width: 24),

          // Right: bell + user
          _RightControls(),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.s2Teal,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.auto_awesome_rounded,
            color: Colors.white,
            size: 18,
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.s2SearchBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.s2Border, width: 1),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          const Icon(
            Icons.search_rounded,
            size: 16,
            color: AppColors.s2TextSecondary,
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search a task...',
                hintStyle: AppTextStyles.s2SearchHint,
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration: BoxDecoration(
              color: AppColors.s2Border,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              '⌘S',
              style: TextStyle(
                color: AppColors.s2TextSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RightControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Bell
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.s2SearchBg,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.s2Border),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            size: 18,
            color: AppColors.s2TextSecondary,
          ),
        ),
        const SizedBox(width: 12),

        // User chip
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.s2Border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar
              Container(
                width: 26,
                height: 26,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF5C6BC0),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'JD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text('John Doe', style: AppTextStyles.s2UserName),
              const SizedBox(width: 6),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 16,
                color: AppColors.s2TextSecondary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
