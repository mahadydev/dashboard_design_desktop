import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class AvatarInfo {
  final String initials;
  final Color color;
  const AvatarInfo(this.initials, this.color);
}

class TaskCardData {
  final String title;
  final String description;
  final double progress;
  final int attachments;
  final int comments;
  final List<AvatarInfo> avatars;

  const TaskCardData({
    required this.title,
    required this.description,
    required this.progress,
    required this.attachments,
    required this.comments,
    required this.avatars,
  });
}

class TaskCard extends StatelessWidget {
  final TaskCardData data;

  const TaskCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.title, style: AppTextStyles.cardTitle),
          const SizedBox(height: 10),
          Text(
            data.description,
            style: AppTextStyles.cardBody,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: data.progress,
              backgroundColor: AppColors.progressBg,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.accentGreen,
              ),
              minHeight: 5,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _MetaIcon(
                icon: Icons.attach_file_rounded,
                count: data.attachments,
              ),
              const SizedBox(width: 14),
              _MetaIcon(
                icon: Icons.chat_bubble_outline_rounded,
                count: data.comments,
              ),
              const Spacer(),
              _AvatarStack(avatars: data.avatars),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetaIcon extends StatelessWidget {
  final IconData icon;
  final int count;

  const _MetaIcon({required this.icon, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text('$count', style: AppTextStyles.cardMeta),
      ],
    );
  }
}

class _AvatarStack extends StatelessWidget {
  final List<AvatarInfo> avatars;

  const _AvatarStack({required this.avatars});

  @override
  Widget build(BuildContext context) {
    const double size = 26;
    const double overlap = 10;

    return SizedBox(
      width: size + (avatars.length - 1) * (size - overlap),
      height: size,
      child: Stack(
        children: List.generate(avatars.length, (index) {
          return Positioned(
            left: index * (size - overlap),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
                color: avatars[index].color,
              ),
              alignment: Alignment.center,
              child: Text(
                avatars[index].initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class TasksSection extends StatelessWidget {
  const TasksSection({super.key});

  static const List<TaskCardData> _tasks = [
    TaskCardData(
      title: 'Implement A',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
      progress: 0.45,
      attachments: 27,
      comments: 15,
      avatars: [
        AvatarInfo('JD', Color(0xFF5C6BC0)),
        AvatarInfo('KL', Color(0xFFEF5350)),
        AvatarInfo('MN', Color(0xFF26A69A)),
      ],
    ),
    TaskCardData(
      title: 'Implement B',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
      progress: 0.30,
      attachments: 20,
      comments: 10,
      avatars: [
        AvatarInfo('AB', Color(0xFFFF7043)),
        AvatarInfo('RS', Color(0xFF42A5F5)),
        AvatarInfo('TU', Color(0xFF66BB6A)),
      ],
    ),
    TaskCardData(
      title: 'Implement C',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
      progress: 0.70,
      attachments: 12,
      comments: 43,
      avatars: [
        AvatarInfo('PQ', Color(0xFFAB47BC)),
        AvatarInfo('VW', Color(0xFF26C6DA)),
        AvatarInfo('XY', Color(0xFFFFA726)),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Awesome Project', style: AppTextStyles.sectionTitle),
                SizedBox(height: 2),
                Text(
                  'Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do.',
                  style: AppTextStyles.sectionSubtitle,
                ),
              ],
            ),
            const Spacer(),
            _ViewAllButton(onTap: () {}),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _FilterDropdownButton(label: 'Tasks in Progress', onTap: () {}),
            const Spacer(),
            _FilterDropdownButton(label: 'Assigned to', onTap: () {}),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: _tasks
              .map(
                (task) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: task == _tasks.last ? 0 : 14,
                    ),
                    child: TaskCard(data: task),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

/// Outlined pill button: "View All >"
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

/// Outlined dropdown pill button
class _FilterDropdownButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _FilterDropdownButton({required this.label, required this.onTap});

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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: AppTextStyles.filterText),
            const SizedBox(width: 6),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 15,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
