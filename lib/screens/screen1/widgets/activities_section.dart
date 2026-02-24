import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class ActivityData {
  final String time;
  final String actorName;
  final String action;
  final String? target;
  final String? preposition;
  final String? destination;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;

  const ActivityData({
    required this.time,
    required this.actorName,
    required this.action,
    this.target,
    this.preposition,
    this.destination,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
  });
}

class ActivitiesSection extends StatelessWidget {
  const ActivitiesSection({super.key});

  static const List<ActivityData> _activities = [
    ActivityData(
      time: '5:30 pm',
      actorName: 'Janice S.',
      action: 'joined',
      destination: 'Project X',
      icon: Icons.person_add_alt_1_rounded,
      iconBg: AppColors.activityIconBlueBg,
      iconColor: AppColors.activityIconBlue,
    ),
    ActivityData(
      time: '4:00 pm',
      actorName: 'Janice S.',
      action: 'moved',
      target: 'Task1',
      preposition: 'from',
      destination: 'Done',
      icon: Icons.pan_tool_alt_rounded,
      iconBg: AppColors.activityIconPurpleBg,
      iconColor: AppColors.activityIconPurple,
    ),
    ActivityData(
      time: '3:50 pm',
      actorName: 'Janice S.',
      action: 'uploaded',
      target: 'Document.pdf',
      icon: Icons.cloud_upload_rounded,
      iconBg: AppColors.activityIconOrangeBg,
      iconColor: AppColors.activityIconOrange,
    ),
    ActivityData(
      time: '9:50 pm',
      actorName: 'Janice S.',
      action: 'removed',
      target: 'John smith',
      preposition: 'from',
      destination: 'Project X',
      icon: Icons.person_remove_alt_1_rounded,
      iconBg: AppColors.activityIconBlueBg,
      iconColor: AppColors.activityIconBlue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              const Text('Activities', style: AppTextStyles.sectionTitle),
              const Spacer(),
              _ViewAllButton(onTap: () {}),
            ],
          ),
          const SizedBox(height: 20),

          // Activity list
          ...List.generate(_activities.length, (index) {
            final activity = _activities[index];
            final isLast = index == _activities.length - 1;
            return _ActivityRow(data: activity, isLast: isLast);
          }),
        ],
      ),
    );
  }
}

class _ViewAllButton extends StatelessWidget {
  final VoidCallback onTap;
  const _ViewAllButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.cardBorder, width: 1.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('View All', style: AppTextStyles.viewAll),
            SizedBox(width: 4),
            Icon(
              Icons.chevron_right_rounded,
              size: 15,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityRow extends StatelessWidget {
  final ActivityData data;
  final bool isLast;

  const _ActivityRow({required this.data, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timestamp — fixed width, right-aligned
          SizedBox(
            width: 62,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                data.time,
                style: AppTextStyles.activityTime,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Timeline column: icon + vertical connector line
          SizedBox(
            width: 36,
            child: Column(
              children: [
                // Icon circle
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: data.iconBg,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(data.icon, color: data.iconColor, size: 16),
                ),
                // Connector line
                if (!isLast)
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 1.5,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        color: AppColors.cardBorder,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Activity text
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: isLast ? 0 : 20),
              child: _ActivityText(data: data),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityText extends StatelessWidget {
  final ActivityData data;

  const _ActivityText({required this.data});

  @override
  Widget build(BuildContext context) {
    final spans = <TextSpan>[];

    spans.add(
      TextSpan(text: '${data.actorName} ', style: AppTextStyles.activityBold),
    );

    spans.add(
      TextSpan(text: '${data.action} ', style: AppTextStyles.activityText),
    );

    if (data.target != null) {
      spans.add(
        TextSpan(text: '${data.target} ', style: AppTextStyles.activityBold),
      );
    }

    if (data.action == 'moved' && data.preposition == 'from') {
      spans.add(
        const TextSpan(text: 'from ', style: AppTextStyles.activityText),
      );
      spans.add(
        TextSpan(text: 'In Progress ', style: AppTextStyles.activityBold),
      );
      spans.add(const TextSpan(text: 'to ', style: AppTextStyles.activityText));
    } else if (data.preposition != null) {
      spans.add(
        TextSpan(
          text: '${data.preposition} ',
          style: AppTextStyles.activityText,
        ),
      );
    }

    if (data.destination != null) {
      spans.add(
        TextSpan(text: data.destination, style: AppTextStyles.activityBold),
      );
    }

    return RichText(text: TextSpan(children: spans));
  }
}
