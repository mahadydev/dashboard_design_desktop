import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class S3LeftPanel extends StatelessWidget {
  const S3LeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: AppColors.s3PageBg,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _UserRow(),
          const SizedBox(height: 16),
          Container(height: 1, color: AppColors.s3Border),
          const SizedBox(height: 12),
          _MessengerSection(),
          const SizedBox(height: 16),
          Container(height: 1, color: AppColors.s3Border),
          const SizedBox(height: 12),
          const _RecentlyViewedSection(),
        ],
      ),
    );
  }
}

// ── User row ──────────────────────────────────────────────────────────────────

class _UserRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.s3SurfaceDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox(
              width: 38,
              height: 38,
              child: Image.network(
                'https://picsum.photos/seed/anastasia_profile/80/80',
                fit: BoxFit.cover,
                errorBuilder: (_, e, s) => Container(
                  color: const Color(0xFF5C6BC0),
                  alignment: Alignment.center,
                  child: const Text(
                    'AP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text('Anastasia Petrenko', style: AppTextStyles.s3UserName),
        ],
      ),
    );
  }
}

// ── Messenger ─────────────────────────────────────────────────────────────────

class _MessengerSection extends StatelessWidget {
  static const _contacts = [
    _ContactDef(
      'Devon Lane',
      'DL',
      Color(0xFF26A69A),
      true,
      'https://picsum.photos/seed/devonlane/80/80',
    ),
    _ContactDef(
      'Ann Pena',
      'AP',
      Color(0xFFEF5350),
      true,
      'https://picsum.photos/seed/annpena/80/80',
    ),
    _ContactDef(
      'Kristin Watson',
      'KW',
      Color(0xFF5C6BC0),
      false,
      'https://picsum.photos/seed/kristinw/80/80',
    ),
    _ContactDef(
      'Wade Warren',
      'WW',
      Color(0xFF66BB6A),
      false,
      'https://picsum.photos/seed/wadewarren/80/80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const Text('Messenger', style: AppTextStyles.s3SectionTitle),
              const Spacer(),
              const Text('All', style: AppTextStyles.s3SectionLink),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ..._contacts.map((c) => _ContactRow(contact: c)),
      ],
    );
  }
}

class _ContactDef {
  final String name;
  final String initials;
  final Color color;
  final bool isOnline;
  final String imageUrl;
  const _ContactDef(
    this.name,
    this.initials,
    this.color,
    this.isOnline,
    this.imageUrl,
  );
}

class _ContactRow extends StatelessWidget {
  final _ContactDef contact;
  const _ContactRow({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          Stack(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 36,
                  height: 36,
                  child: Image.network(
                    contact.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, e, s) => Container(
                      color: contact.color,
                      alignment: Alignment.center,
                      child: Text(
                        contact.initials,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    color: contact.isOnline
                        ? AppColors.s3Green
                        : AppColors.s3SurfaceMid,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.s3PageBg, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Text(contact.name, style: AppTextStyles.s3MessengerName),
        ],
      ),
    );
  }
}

// ── Recently Viewed ───────────────────────────────────────────────────────────

class _RecentlyViewedSection extends StatelessWidget {
  const _RecentlyViewedSection();

  // picsum seeds chosen to match the screenshot themes:
  // dress, lipstick/makeup, plant, fashion woman, chair/interior, succulent
  static const _imageUrls = [
    'https://picsum.photos/seed/fashion1/160/160',
    'https://picsum.photos/seed/makeup1/160/160',
    'https://picsum.photos/seed/plant1/160/160',
    'https://picsum.photos/seed/fashion2/160/160',
    'https://picsum.photos/seed/interior1/160/160',
    'https://picsum.photos/seed/plant2/160/160',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const Text(
                'Recently Viewed',
                style: AppTextStyles.s3SectionTitle,
              ),
              const Spacer(),
              const Icon(
                Icons.more_horiz,
                color: AppColors.s3TextSecondary,
                size: 20,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.0,
            children: _imageUrls.map((url) => _ThumbImage(url: url)).toList(),
          ),
        ),
      ],
    );
  }
}

class _ThumbImage extends StatelessWidget {
  final String url;
  const _ThumbImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        fit: BoxFit.cover,
        errorBuilder: (_, e, s) => Container(color: AppColors.s3SurfaceMid),
      ),
    );
  }
}
