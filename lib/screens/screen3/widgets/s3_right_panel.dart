import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class S3RightPanel extends StatelessWidget {
  const S3RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: AppColors.s3PageBg,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _EventsFeaturedCard(),
          const SizedBox(height: 16),
          const _RecentlyEventsSection(),
        ],
      ),
    );
  }
}

// ── Featured Events Card ──────────────────────────────────────────────────────

class _EventsFeaturedCard extends StatelessWidget {
  const _EventsFeaturedCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.s3SurfaceDark,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 10, 10),
            child: Row(
              children: [
                const Text('Events', style: AppTextStyles.s3SectionTitle),
                const Spacer(),
                const Icon(
                  Icons.more_horiz_rounded,
                  color: AppColors.s3TextSecondary,
                  size: 20,
                ),
              ],
            ),
          ),

          // Party photo — real image with "Great Party" overlay
          SizedBox(
            width: double.infinity,
            height: 130,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://picsum.photos/seed/greatparty/400/260',
                  fit: BoxFit.cover,
                  errorBuilder: (context, e, s) => Container(
                    color: const Color(0xFF1A0A2E),
                    child: const Icon(
                      Icons.celebration_rounded,
                      color: Colors.white38,
                      size: 40,
                    ),
                  ),
                ),
                // Dark gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.2),
                        Colors.black.withValues(alpha: 0.55),
                      ],
                    ),
                  ),
                ),
                // "Great Party" text overlay
                const Positioned(
                  left: 14,
                  bottom: 14,
                  child: Text(
                    'Great Party',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Location info
          const Padding(
            padding: EdgeInsets.fromLTRB(14, 10, 14, 14),
            child: Text(
              'Kyiv. Bogdan Khmelnytskogo street',
              style: AppTextStyles.s3EventSubtitle,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Recently Events ───────────────────────────────────────────────────────────

class _RecentlyEventsSection extends StatelessWidget {
  const _RecentlyEventsSection();

  static const _events = [
    _EventItem(
      'Save the Museum',
      '10 des 2020',
      'https://picsum.photos/seed/museum1/120/96',
    ),
    _EventItem(
      'Friends meeting',
      '12 des 2020',
      'https://picsum.photos/seed/friends1/120/96',
    ),
    _EventItem(
      'Tea ceremony',
      '18 des 2020',
      'https://picsum.photos/seed/teacup1/120/96',
    ),
    _EventItem(
      'Breakfast by the sea',
      '28 des 2020',
      'https://picsum.photos/seed/seaside1/120/96',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.s3SurfaceDark,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Recently Events',
                style: AppTextStyles.s3SectionTitle,
              ),
              const Spacer(),
              const Text('All', style: AppTextStyles.s3SectionLink),
            ],
          ),
          const SizedBox(height: 14),
          ..._events.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _EventRow(event: e),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventItem {
  final String title;
  final String date;
  final String imageUrl;
  const _EventItem(this.title, this.date, this.imageUrl);
}

class _EventRow extends StatelessWidget {
  final _EventItem event;
  const _EventRow({required this.event});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Thumbnail with real image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 52,
            height: 48,
            child: Image.network(
              event.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, e, s) => Container(
                color: AppColors.s3SurfaceMid,
                child: const Icon(
                  Icons.image_rounded,
                  color: Colors.white38,
                  size: 22,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Title + date
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(event.title, style: AppTextStyles.s3EventItemTitle),
              const SizedBox(height: 3),
              Text(event.date, style: AppTextStyles.s3EventItemDate),
            ],
          ),
        ),
      ],
    );
  }
}
