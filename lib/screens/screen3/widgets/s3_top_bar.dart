import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class S3TopBar extends StatelessWidget {
  const S3TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: AppColors.s3TopBar,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // FB Logo
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.s3Blue,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'f',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  height: 1.1,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Nav icons (center)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _NavIcon(icon: Icons.home_rounded, isActive: true),
                _NavIcon(icon: Icons.people_alt_rounded, isActive: false),
                _NavIcon(icon: Icons.ondemand_video_rounded, isActive: false),
                _NavIcon(icon: Icons.store_rounded, isActive: false),
                _NavIcon(icon: Icons.widgets_rounded, isActive: false),
              ],
            ),
          ),

          // Search bar
          _SearchBar(),
          const SizedBox(width: 10),

          // Create button
          _CreateButton(),
          const SizedBox(width: 10),

          // Right icons
          _IconBubble(icon: Icons.notifications_rounded),
          const SizedBox(width: 8),
          _IconBubble(icon: Icons.messenger_rounded),
          const SizedBox(width: 8),
          _DropdownBubble(),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  const _NavIcon({required this.icon, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 56,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isActive ? AppColors.s3Blue : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: Icon(
        icon,
        size: 24,
        color: isActive ? AppColors.s3Blue : AppColors.s3NavInactive,
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.s3InputBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          SizedBox(width: 12),
          Icon(
            Icons.search_rounded,
            size: 18,
            color: AppColors.s3TextSecondary,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: AppColors.s3TextSecondary,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(color: AppColors.s3TextPrimary, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.s3Blue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text('Create', style: AppTextStyles.s3CreateBtn),
    );
  }
}

class _IconBubble extends StatelessWidget {
  final IconData icon;
  const _IconBubble({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: const BoxDecoration(
        color: AppColors.s3SurfaceMid,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: AppColors.s3TextPrimary),
    );
  }
}

class _DropdownBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: const BoxDecoration(
        color: AppColors.s3SurfaceMid,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 22,
        color: AppColors.s3TextPrimary,
      ),
    );
  }
}
