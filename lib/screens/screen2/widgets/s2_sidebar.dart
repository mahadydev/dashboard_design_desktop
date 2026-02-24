import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class S2Sidebar extends StatefulWidget {
  const S2Sidebar({super.key});

  @override
  State<S2Sidebar> createState() => _S2SidebarState();
}

class _S2SidebarState extends State<S2Sidebar> {
  int _activeIndex = 1; // Board is active by default

  final List<IconData> _topIcons = [
    Icons.home_rounded,
    Icons.dashboard_rounded, // Board (active)
    Icons.check_circle_outline_rounded,
    Icons.group_rounded,
    Icons.calendar_today_rounded,
  ];

  final List<IconData> _bottomIcons = [
    Icons.settings_rounded,
    Icons.headset_mic_rounded,
    Icons.logout_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),

          // Top nav icons
          ...List.generate(_topIcons.length, (i) {
            final isActive = i == _activeIndex;
            return _SidebarIcon(
              icon: _topIcons[i],
              isActive: isActive,
              onTap: () => setState(() => _activeIndex = i),
            );
          }),

          const Spacer(),

          // Bottom icons
          ..._bottomIcons.map(
            (icon) => _SidebarIcon(icon: icon, isActive: false, onTap: () {}),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _SidebarIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _SidebarIcon({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          color: isActive ? AppColors.s2Yellow : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          size: 19,
          color: isActive ? Colors.white : AppColors.s2TextSecondary,
        ),
      ),
    );
  }
}
