import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class S2ProjectHeader extends StatefulWidget {
  const S2ProjectHeader({super.key});

  @override
  State<S2ProjectHeader> createState() => _S2ProjectHeaderState();
}

class _S2ProjectHeaderState extends State<S2ProjectHeader> {
  int _activeTab = 2; // Board

  final List<_TabItem> _tabs = const [
    _TabItem(Icons.grid_view_rounded, 'Overview'),
    _TabItem(Icons.list_rounded, 'List'),
    _TabItem(Icons.view_kanban_rounded, 'Board'),
    _TabItem(Icons.calendar_today_rounded, 'Calendar'),
    _TabItem(Icons.description_rounded, 'Documents'),
    _TabItem(Icons.chat_bubble_outline_rounded, 'Messages'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title + subtitle
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NovaBoard Mobile App',
                  style: AppTextStyles.s2ProjectTitle,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('Client: ', style: AppTextStyles.s2SubMeta),
                    const Text(
                      'Arcadia Solutions',
                      style: AppTextStyles.s2SubMetaBold,
                    ),
                    const Text(
                      '  •  Timeline: ',
                      style: AppTextStyles.s2SubMeta,
                    ),
                    const Text(
                      'May 20 – June 30, 2025',
                      style: AppTextStyles.s2SubMetaBold,
                    ),
                    const Text('  •  ', style: AppTextStyles.s2SubMeta),
                    _StatusBadge(),
                  ],
                ),
              ],
            ),
            const Spacer(),

            // Right action cluster
            _AvatarStack(),
            const SizedBox(width: 16),
            _ActionButton(icon: Icons.open_in_new_rounded, label: 'Share'),
            const SizedBox(width: 8),
            _ActionButton(icon: Icons.settings_rounded, label: 'Settings'),
            const SizedBox(width: 8),
            _ActionButton(
              icon: Icons.person_add_alt_1_rounded,
              label: 'Invite People',
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Tab bar
        Row(
          children: List.generate(_tabs.length, (i) {
            final isActive = i == _activeTab;
            return Padding(
              padding: const EdgeInsets.only(right: 4),
              child: GestureDetector(
                onTap: () => setState(() => _activeTab = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.s2Yellow : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _tabs[i].icon,
                        size: 14,
                        color: isActive
                            ? AppColors.s2TextPrimary
                            : AppColors.s2TextSecondary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _tabs[i].label,
                        style: isActive
                            ? AppTextStyles.s2TabActive
                            : AppTextStyles.s2TabInactive,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _TabItem {
  final IconData icon;
  final String label;
  const _TabItem(this.icon, this.label);
}

class _StatusBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.s2Teal.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'In Progress',
        style: TextStyle(
          color: AppColors.s2Teal,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _AvatarStack extends StatelessWidget {
  static const _colors = [
    Color(0xFF5C6BC0),
    Color(0xFFEF5350),
    Color(0xFF26A69A),
    Color(0xFFFF7043),
    Color(0xFF66BB6A),
  ];
  static const _initials = ['JD', 'KL', 'MN', 'AB', 'RS'];

  @override
  Widget build(BuildContext context) {
    const double size = 28;
    const double overlap = 10;
    const int count = 5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size + (count - 1) * (size - overlap),
          height: size,
          child: Stack(
            children: List.generate(
              count,
              (i) => Positioned(
                left: i * (size - overlap).toDouble(),
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _colors[i],
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _initials[i],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.s2SearchBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.s2Border),
          ),
          child: const Text(
            '+5',
            style: TextStyle(
              color: AppColors.s2TextSecondary,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColors.s2Border, width: 1.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.s2TextSecondary),
          const SizedBox(width: 6),
          Text(label, style: AppTextStyles.s2BtnLabel),
        ],
      ),
    );
  }
}
