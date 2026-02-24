import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

// ── Data models ───────────────────────────────────────────────────────────────

enum KanbanPriority { low, medium, high }

class AvatarDef {
  final String initials;
  final Color color;
  const AvatarDef(this.initials, this.color);
}

class KanbanCardData {
  final KanbanPriority priority;
  final String title;
  final String note;
  final double progress;
  final int files;
  final int comments;
  final List<AvatarDef> avatars;

  const KanbanCardData({
    required this.priority,
    required this.title,
    required this.note,
    required this.progress,
    required this.files,
    required this.comments,
    required this.avatars,
  });
}

class KanbanColumnData {
  final String title;
  final Color bgColor;
  final Color dotColor;
  final List<KanbanCardData> cards;

  const KanbanColumnData({
    required this.title,
    required this.bgColor,
    required this.dotColor,
    required this.cards,
  });
}

// ── Static data ───────────────────────────────────────────────────────────────

const _columns = <KanbanColumnData>[
  KanbanColumnData(
    title: 'To Do',
    bgColor: AppColors.s2ColTodo,
    dotColor: AppColors.s2DotTodo,
    cards: [
      KanbanCardData(
        priority: KanbanPriority.medium,
        title: 'Design Notification Banner',
        note: 'Note: Ensure it adapts well in both light and dark themes.',
        progress: 0.0,
        files: 0,
        comments: 2,
        avatars: [AvatarDef('JD', Color(0xFF5C6BC0))],
      ),
      KanbanCardData(
        priority: KanbanPriority.low,
        title: 'Write Error Message Guidelines',
        note: '',
        progress: 0.0,
        files: 1,
        comments: 1,
        avatars: [AvatarDef('KL', Color(0xFFEF5350))],
      ),
      KanbanCardData(
        priority: KanbanPriority.medium,
        title: 'Create Avatar Component',
        note: '',
        progress: 0.10,
        files: 2,
        comments: 0,
        avatars: [AvatarDef('MN', Color(0xFF26A69A))],
      ),
    ],
  ),
  KanbanColumnData(
    title: 'In Progress',
    bgColor: AppColors.s2ColProgress,
    dotColor: AppColors.s2DotProgress,
    cards: [
      KanbanCardData(
        priority: KanbanPriority.high,
        title: 'Create Dashboard Wireframe',
        note: 'Note: Client wants more whitespace in the left sidebar.',
        progress: 0.60,
        files: 3,
        comments: 5,
        avatars: [
          AvatarDef('AB', Color(0xFFFF7043)),
          AvatarDef('RS', Color(0xFF66BB6A)),
        ],
      ),
      KanbanCardData(
        priority: KanbanPriority.medium,
        title: 'API Endpoint Mapping',
        note: '',
        progress: 0.40,
        files: 2,
        comments: 1,
        avatars: [AvatarDef('TU', Color(0xFF42A5F5))],
      ),
      KanbanCardData(
        priority: KanbanPriority.low,
        title: 'Dark Mode Theme Integration',
        note: '',
        progress: 0.25,
        files: 1,
        comments: 2,
        avatars: [
          AvatarDef('PQ', Color(0xFFAB47BC)),
          AvatarDef('VW', Color(0xFF26C6DA)),
        ],
      ),
    ],
  ),
  KanbanColumnData(
    title: 'In Review',
    bgColor: AppColors.s2ColReview,
    dotColor: AppColors.s2DotReview,
    cards: [
      KanbanCardData(
        priority: KanbanPriority.low,
        title: 'Mobile Navigation Prototype',
        note: 'Note: Check responsiveness on iOS devices.',
        progress: 1.0,
        files: 2,
        comments: 4,
        avatars: [AvatarDef('XY', Color(0xFFFFA726))],
      ),
      KanbanCardData(
        priority: KanbanPriority.medium,
        title: 'Team Settings Layout',
        note: '',
        progress: 1.0,
        files: 1,
        comments: 3,
        avatars: [
          AvatarDef('JD', Color(0xFF5C6BC0)),
          AvatarDef('KL', Color(0xFFEF5350)),
        ],
      ),
    ],
  ),
  KanbanColumnData(
    title: 'Completed',
    bgColor: AppColors.s2ColDone,
    dotColor: AppColors.s2DotDone,
    cards: [
      KanbanCardData(
        priority: KanbanPriority.medium,
        title: 'Landing Page Copywriting',
        note: '',
        progress: 1.0,
        files: 2,
        comments: 6,
        avatars: [
          AvatarDef('MN', Color(0xFF26A69A)),
          AvatarDef('AB', Color(0xFFFF7043)),
        ],
      ),
      KanbanCardData(
        priority: KanbanPriority.medium,
        title: 'Brand Color Exploration',
        note: 'Note: Colors approved for both web and mobile.',
        progress: 1.0,
        files: 3,
        comments: 1,
        avatars: [
          AvatarDef('RS', Color(0xFF66BB6A)),
          AvatarDef('TU', Color(0xFF42A5F5)),
          AvatarDef('PQ', Color(0xFFAB47BC)),
          AvatarDef('VW', Color(0xFF26C6DA)),
        ],
      ),
      KanbanCardData(
        priority: KanbanPriority.high,
        title: 'App Icon Design',
        note: '',
        progress: 1.0,
        files: 1,
        comments: 3,
        avatars: [
          AvatarDef('XY', Color(0xFFFFA726)),
          AvatarDef('JD', Color(0xFF5C6BC0)),
          AvatarDef('KL', Color(0xFFEF5350)),
          AvatarDef('MN', Color(0xFF26A69A)),
        ],
      ),
    ],
  ),
];

// ── Board ─────────────────────────────────────────────────────────────────────

class S2KanbanBoard extends StatelessWidget {
  const S2KanbanBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(_columns.length, (i) {
        final col = _columns[i];
        final isLast = i == _columns.length - 1;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 12),
            child: _KanbanCol(data: col),
          ),
        );
      }),
    );
  }
}

// ── Column ────────────────────────────────────────────────────────────────────

class _KanbanCol extends StatelessWidget {
  final KanbanColumnData data;
  const _KanbanCol({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: data.bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: data.dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(data.title, style: AppTextStyles.s2ColTitle),
              const Spacer(),
              const Icon(
                Icons.more_horiz_rounded,
                size: 18,
                color: AppColors.s2TextSecondary,
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Cards
          ...data.cards.map(
            (card) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _KanbanCardWidget(card: card),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Card ──────────────────────────────────────────────────────────────────────

class _KanbanCardWidget extends StatelessWidget {
  final KanbanCardData card;
  const _KanbanCardWidget({required this.card});

  @override
  Widget build(BuildContext context) {
    final pct = (card.progress * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PriorityBadge(priority: card.priority),
          const SizedBox(height: 8),
          Text(card.title, style: AppTextStyles.s2CardTitle),
          if (card.note.isNotEmpty) ...[
            const SizedBox(height: 5),
            Text(card.note, style: AppTextStyles.s2CardNote),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('Progress', style: AppTextStyles.s2ProgressLabel),
              const Spacer(),
              Text('$pct%', style: AppTextStyles.s2ProgressValue),
            ],
          ),
          const SizedBox(height: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: card.progress,
              minHeight: 4,
              backgroundColor: AppColors.s2ProgressBg,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.s2ProgressBar,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _MiniAvatarStack(avatars: card.avatars),
              const Spacer(),
              _MetaIcon(
                icon: Icons.insert_drive_file_outlined,
                count: card.files,
              ),
              const SizedBox(width: 10),
              _MetaIcon(
                icon: Icons.chat_bubble_outline_rounded,
                count: card.comments,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Priority badge ────────────────────────────────────────────────────────────

class _PriorityBadge extends StatelessWidget {
  final KanbanPriority priority;
  const _PriorityBadge({required this.priority});

  @override
  Widget build(BuildContext context) {
    final Color textColor;
    final Color bgColor;
    final String label;

    switch (priority) {
      case KanbanPriority.low:
        textColor = AppColors.s2PrioLowText;
        bgColor = AppColors.s2PrioLowBg;
        label = 'Low';
      case KanbanPriority.medium:
        textColor = AppColors.s2PrioMedText;
        bgColor = AppColors.s2PrioMedBg;
        label = 'Medium';
      case KanbanPriority.high:
        textColor = AppColors.s2PrioHighText;
        bgColor = AppColors.s2PrioHighBg;
        label = 'High';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ── Mini avatar stack ─────────────────────────────────────────────────────────

class _MiniAvatarStack extends StatelessWidget {
  final List<AvatarDef> avatars;
  const _MiniAvatarStack({required this.avatars});

  @override
  Widget build(BuildContext context) {
    const double size = 22;
    const double overlap = 8;
    final display = avatars.length > 3 ? avatars.sublist(0, 3) : avatars;
    final extra = avatars.length > 3 ? avatars.length - 3 : 0;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size + (display.length - 1) * (size - overlap),
          height: size,
          child: Stack(
            children: List.generate(
              display.length,
              (i) => Positioned(
                left: i * (size - overlap),
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: display[i].color,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    display[i].initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (extra > 0) ...[
          const SizedBox(width: 4),
          Text(
            '+$extra',
            style: const TextStyle(
              color: AppColors.s2TextSecondary,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}

// ── Meta icon ─────────────────────────────────────────────────────────────────

class _MetaIcon extends StatelessWidget {
  final IconData icon;
  final int count;
  const _MetaIcon({required this.icon, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: AppColors.s2TextMeta),
        const SizedBox(width: 3),
        Text('$count', style: AppTextStyles.s2CardMeta),
      ],
    );
  }
}
