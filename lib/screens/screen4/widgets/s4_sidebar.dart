import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class S4Sidebar extends StatelessWidget {
  const S4Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: AppColors.s4SidebarBg,
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(text: 'ACRU', style: AppTextStyles.s4Logo),
                  TextSpan(
                    text: 'I',
                    style: TextStyle(
                      color: AppColors.s4Green,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Nav items
          _NavItem(
            icon: Icons.grid_view_rounded,
            label: 'Dashboard',
            active: true,
          ),
          _NavItem(icon: Icons.account_circle_outlined, label: 'Accounts'),
          _NavItem(
            icon: Icons.swap_horiz_rounded,
            label: 'Transactions',
            hasChevron: true,
            children: [
              _SubNavItem(label: 'History', badge: '19', active: false),
              _SubNavItem(label: 'Integration'),
              _SubNavItem(label: 'Reports'),
            ],
          ),
          _NavItem(icon: Icons.water_drop_outlined, label: 'Cash flow'),
          _NavItem(
            icon: Icons.account_balance_wallet_outlined,
            label: 'Budget',
          ),
          _NavItem(icon: Icons.trending_up_rounded, label: 'Investments'),

          const Spacer(),

          // Divider
          Container(
            height: 1,
            color: AppColors.s4Border,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          const SizedBox(height: 16),

          _NavItem(icon: Icons.menu_book_outlined, label: 'Learning center'),
          _NavItem(icon: Icons.headset_mic_outlined, label: 'Support'),

          const SizedBox(height: 16),

          // Upgrade card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.s4CardBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.s4Border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: AppColors.s4TextPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.bolt_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: const Icon(
                          Icons.close_rounded,
                          size: 14,
                          color: AppColors.s4TextSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Upgrade to Pro!',
                    style: TextStyle(
                      color: AppColors.s4TextPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Full financial insights with\nanalytics and graphs.',
                    style: TextStyle(
                      color: AppColors.s4TextSecondary,
                      fontSize: 11,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.s4TextPrimary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Upgrade now',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Collapse sidebar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                const Icon(
                  Icons.keyboard_double_arrow_left_rounded,
                  size: 16,
                  color: AppColors.s4TextSecondary,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Collapse sidebar',
                  style: AppTextStyles.s4SidebarInactive,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final bool hasChevron;
  final List<Widget> children;

  const _NavItem({
    required this.icon,
    required this.label,
    this.active = false,
    this.hasChevron = false,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
          decoration: BoxDecoration(
            color: active ? AppColors.s4GreenBg : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 0,
            ),
            leading: Icon(
              icon,
              size: 18,
              color: active
                  ? AppColors.s4TextPrimary
                  : AppColors.s4TextSecondary,
            ),
            title: Text(
              label,
              style: active
                  ? AppTextStyles.s4SidebarActive
                  : AppTextStyles.s4SidebarInactive,
            ),
            trailing: hasChevron
                ? const Icon(
                    Icons.expand_more_rounded,
                    size: 16,
                    color: AppColors.s4TextSecondary,
                  )
                : null,
            visualDensity: const VisualDensity(vertical: -2),
            minLeadingWidth: 20,
          ),
        ),
        if (children.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 54),
            child: Column(children: children),
          ),
      ],
    );
  }
}

class _SubNavItem extends StatelessWidget {
  final String label;
  final String? badge;
  final bool active;
  const _SubNavItem({required this.label, this.badge, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Row(
        children: [
          Text(
            label,
            style: active
                ? AppTextStyles.s4SidebarSubActive
                : AppTextStyles.s4SidebarSub,
          ),
          if (badge != null) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.s4TextPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                badge!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
