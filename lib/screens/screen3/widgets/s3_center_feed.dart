import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class S3CenterFeed extends StatelessWidget {
  const S3CenterFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          _StoriesRow(),
          const SizedBox(height: 12),
          const _PostComposer(),
          const SizedBox(height: 12),
          const _FeedList(),
        ],
      ),
    );
  }
}

// ── Stories ───────────────────────────────────────────────────────────────────

class _StoriesRow extends StatelessWidget {
  // picsum.photos/seed/<seed>/w/h — deterministic, no auth, CC0
  static const _stories = [
    _StoryData(
      'Ann Pena',
      'AP',
      Color(0xFFEF5350),
      'https://picsum.photos/seed/flower/200/380',
    ),
    _StoryData(
      'Wade Warren',
      'WW',
      Color(0xFF66BB6A),
      'https://picsum.photos/seed/wade/200/380',
    ),
    _StoryData(
      'Kristin Watson',
      'KW',
      Color(0xFF5C6BC0),
      'https://picsum.photos/seed/mountain/200/380',
    ),
    _StoryData(
      'Devon Lane',
      'DL',
      Color(0xFF26A69A),
      'https://picsum.photos/seed/devon/200/380',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Row(
        children: [
          // Add Story card (no network image)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _AddStoryCard(),
            ),
          ),
          // Photo story cards
          ...List.generate(_stories.length, (i) {
            final s = _stories[i];
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: i < _stories.length - 1 ? 8 : 0,
                ),
                child: _StoryCard(story: s),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _StoryData {
  final String name;
  final String initials;
  final Color avatarColor;
  final String imageUrl;
  const _StoryData(this.name, this.initials, this.avatarColor, this.imageUrl);
}

class _AddStoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background photo (user's own profile pic area)
          Image.network(
            'https://picsum.photos/seed/anastasia/200/380',
            fit: BoxFit.cover,
            errorBuilder: (_, e, s) =>
                Container(color: const Color(0xFF3A3B3C)),
          ),

          // Bottom dark strip with + button
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 70,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, AppColors.s3SurfaceDark],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: AppColors.s3Blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 18),
                  ),
                  const SizedBox(height: 6),
                  const Text('Add Story', style: AppTextStyles.s3StoryLabel),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final _StoryData story;
  const _StoryCard({required this.story});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Real photo
          Image.network(
            story.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, e, s) =>
                Container(color: story.avatarColor.withValues(alpha: 0.4)),
          ),

          // Bottom name gradient
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 64,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.72),
                  ],
                ),
              ),
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 10),
              alignment: Alignment.bottomLeft,
              child: Text(story.name, style: AppTextStyles.s3StoryLabel),
            ),
          ),

          // Avatar top-left with blue ring
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.s3Blue, width: 2.5),
                color: story.avatarColor,
              ),
              alignment: Alignment.center,
              child: Text(
                story.initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          // Three-dot (last story only)
          if (story.name == 'Devon Lane')
            Positioned(
              bottom: 10,
              right: 8,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// ── Post Composer ─────────────────────────────────────────────────────────────

class _PostComposer extends StatelessWidget {
  const _PostComposer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.s3SurfaceDark,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF5C6BC0),
            ),
            alignment: Alignment.center,
            child: const Text(
              'AP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Input pill
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.s3SurfaceMid,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Anastasia, what's the latest?",
                      style: AppTextStyles.s3ComposerHint,
                    ),
                  ),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: const BoxDecoration(
                      color: AppColors.s3SurfaceDark,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18,
                      color: AppColors.s3TextSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Feed Post ─────────────────────────────────────────────────────────────────

class _PostData {
  final String author;
  final String initials;
  final Color avatarColor;
  final String meta;
  final String body;
  final String? imageUrl;
  final int likes;
  final int comments;
  final int shares;
  const _PostData({
    required this.author,
    required this.initials,
    required this.avatarColor,
    required this.meta,
    required this.body,
    this.imageUrl,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
  });
}

class _FeedList extends StatelessWidget {
  static const _posts = [
    _PostData(
      author: 'Kathryn Murphy',
      initials: 'KM',
      avatarColor: Color(0xFFEF5350),
      meta: 'Kyiv Pechersk Lavra · 5 min ago',
      body:
          'Unusual weekends! 😀 Sometimes the best adventures are the ones closest to home.',
      imageUrl: 'https://picsum.photos/seed/kyivcity/800/480',
      likes: 142,
      comments: 38,
      shares: 12,
    ),
    _PostData(
      author: 'Devon Lane',
      initials: 'DL',
      avatarColor: Color(0xFF26A69A),
      meta: 'Santorini, Greece · 22 min ago',
      body: 'Golden hour never disappoints. This place is pure magic. ✨🌅',
      imageUrl: 'https://picsum.photos/seed/santorini_sunset/800/480',
      likes: 389,
      comments: 74,
      shares: 55,
    ),
    _PostData(
      author: 'Ann Pena',
      initials: 'AP',
      avatarColor: Color(0xFF5C6BC0),
      meta: '1 hr ago',
      body:
          'Just finished my morning workout routine and feeling absolutely incredible 💪🔥 Consistency is the key — day 47 of 100!',
      likes: 211,
      comments: 29,
      shares: 8,
    ),
    _PostData(
      author: 'Wade Warren',
      initials: 'WW',
      avatarColor: Color(0xFF66BB6A),
      meta: 'Central Park, NYC · 2 hrs ago',
      body:
          'Autumn in the city hits different. The colors this year are absolutely stunning 🍂🍁',
      imageUrl: 'https://picsum.photos/seed/autumnpark/800/480',
      likes: 97,
      comments: 16,
      shares: 4,
    ),
    _PostData(
      author: 'Kristin Watson',
      initials: 'KW',
      avatarColor: Color(0xFFAB47BC),
      meta: '3 hrs ago',
      body:
          'Hot take: the best coffee is the one you make at home on a rainy Sunday morning ☕🌧️ Change my mind.',
      likes: 563,
      comments: 141,
      shares: 88,
    ),
    _PostData(
      author: 'Devon Lane',
      initials: 'DL',
      avatarColor: Color(0xFF26A69A),
      meta: 'Amalfi Coast, Italy · 4 hrs ago',
      body:
          'Road trip along the coast with the crew. No plans, just good vibes and better views 🚗🌊',
      imageUrl: 'https://picsum.photos/seed/amalficoast/800/480',
      likes: 478,
      comments: 92,
      shares: 34,
    ),
    _PostData(
      author: 'Kathryn Murphy',
      initials: 'KM',
      avatarColor: Color(0xFFEF5350),
      meta: '5 hrs ago',
      body:
          'Just wrapped up the design sprint — the new product is going to be amazing. Proud of this team ❤️',
      likes: 204,
      comments: 47,
      shares: 19,
    ),
    _PostData(
      author: 'Ann Pena',
      initials: 'AP',
      avatarColor: Color(0xFF5C6BC0),
      meta: 'Kyoto, Japan · 6 hrs ago',
      body:
          'The bamboo forest in Arashiyama is something else entirely. Words and photos don\'t do it justice 🎋',
      imageUrl: 'https://picsum.photos/seed/bambooforest/800/480',
      likes: 821,
      comments: 203,
      shares: 114,
    ),
    _PostData(
      author: 'Wade Warren',
      initials: 'WW',
      avatarColor: Color(0xFF66BB6A),
      meta: '7 hrs ago',
      body:
          'Reminder: it\'s okay to take a break. Rest is productive too. Take care of yourselves out there 💙',
      likes: 1204,
      comments: 88,
      shares: 340,
    ),
    _PostData(
      author: 'Kristin Watson',
      initials: 'KW',
      avatarColor: Color(0xFFAB47BC),
      meta: 'Tulum, Mexico · 8 hrs ago',
      body:
          'Paradise found 🌴 This trip has been everything I needed. Completely disconnected from the world for a week.',
      imageUrl: 'https://picsum.photos/seed/tulumbeach/800/480',
      likes: 677,
      comments: 131,
      shares: 62,
    ),
    _PostData(
      author: 'Devon Lane',
      initials: 'DL',
      avatarColor: Color(0xFF26A69A),
      meta: '9 hrs ago',
      body:
          'Cooked my grandmother\'s recipe for the first time tonight. It tasted exactly the way I remembered 🍲❤️ Some things never change.',
      likes: 934,
      comments: 178,
      shares: 97,
    ),
  ];

  const _FeedList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _posts
          .map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _FeedPost(data: p),
            ),
          )
          .toList(),
    );
  }
}

class _FeedPost extends StatelessWidget {
  final _PostData data;
  const _FeedPost({required this.data});

  String _formatCount(int n) {
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return '$n';
  }

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
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data.avatarColor,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    data.initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.author, style: AppTextStyles.s3PostAuthor),
                      const SizedBox(height: 2),
                      Text(data.meta, style: AppTextStyles.s3PostMeta),
                    ],
                  ),
                ),
                const Icon(
                  Icons.more_horiz_rounded,
                  color: AppColors.s3TextSecondary,
                  size: 20,
                ),
              ],
            ),
          ),

          // Post text
          Padding(
            padding: EdgeInsets.fromLTRB(
              14,
              0,
              14,
              data.imageUrl != null ? 12 : 0,
            ),
            child: Text(data.body, style: AppTextStyles.s3PostBody),
          ),

          // Optional post image
          if (data.imageUrl != null)
            SizedBox(
              width: double.infinity,
              height: 220,
              child: Image.network(
                data.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, e, s) => Container(
                  color: AppColors.s3SurfaceMid,
                  child: const Center(
                    child: Icon(
                      Icons.image_rounded,
                      color: Colors.white38,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),

          // Reaction counts row
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 4),
            child: Row(
              children: [
                // Like emoji pills
                Row(
                  children: [
                    _ReactionChip(emoji: '👍', color: const Color(0xFF1877F2)),
                    _ReactionChip(emoji: '❤️', color: const Color(0xFFE0245E)),
                    _ReactionChip(emoji: '😂', color: const Color(0xFFF7AF30)),
                    const SizedBox(width: 6),
                    Text(
                      _formatCount(data.likes),
                      style: const TextStyle(
                        color: AppColors.s3TextSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '${_formatCount(data.comments)} comments · ${_formatCount(data.shares)} shares',
                  style: const TextStyle(
                    color: AppColors.s3TextSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Container(
            height: 1,
            color: AppColors.s3SurfaceMid,
            margin: const EdgeInsets.symmetric(horizontal: 14),
          ),

          // Action buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                _ActionButton(icon: Icons.thumb_up_alt_outlined, label: 'Like'),
                _ActionButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  label: 'Comment',
                ),
                _ActionButton(icon: Icons.share_outlined, label: 'Share'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ReactionChip extends StatelessWidget {
  final String emoji;
  final Color color;
  const _ReactionChip({required this.emoji, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(right: 2),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(emoji, style: const TextStyle(fontSize: 10)),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18, color: AppColors.s3TextSecondary),
        label: Text(
          label,
          style: const TextStyle(
            color: AppColors.s3TextSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }
}
