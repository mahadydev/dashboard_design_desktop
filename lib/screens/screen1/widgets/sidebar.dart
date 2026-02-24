import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;

  final List<_NavItem> _navItems = [
    _NavItem(icon: Icons.dashboard_rounded, label: 'Dashboard'),
    _NavItem(icon: Icons.calendar_today_rounded, label: 'Calendar'),
    _NavItem(icon: Icons.checklist_rounded, label: 'Tasks'),
    _NavItem(icon: Icons.description_rounded, label: 'Documents'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: AppColors.sidebarBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 36, bottom: 48),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'ReWorked', style: AppTextStyles.logoMain),
                  TextSpan(text: '.eu', style: AppTextStyles.logoAccent),
                ],
              ),
            ),
          ),

          // Nav Items
          Expanded(
            child: Column(
              children: List.generate(_navItems.length, (index) {
                final item = _navItems[index];
                final isActive = _selectedIndex == index;
                return _NavItemWidget(
                  item: item,
                  isActive: isActive,
                  onTap: () => setState(() => _selectedIndex = index),
                );
              }),
            ),
          ),

          // User profile
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 28),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF5C6BC0),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'RC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('Ronak C.', style: AppTextStyles.userNameSidebar),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white54,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}

class _NavItemWidget extends StatelessWidget {
  final _NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItemWidget({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            // Active indicator bar
            Container(
              width: 4,
              height: 48,
              decoration: BoxDecoration(
                color: isActive ? AppColors.accentGreen : Colors.transparent,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Icon(
              item.icon,
              size: 20,
              color: isActive ? Colors.white : AppColors.textSidebarInactive,
            ),
            const SizedBox(width: 14),
            Text(
              item.label,
              style: isActive
                  ? AppTextStyles.sidebarItemActive
                  : AppTextStyles.sidebarItemInactive,
            ),
          ],
        ),
      ),
    );
  }
}
