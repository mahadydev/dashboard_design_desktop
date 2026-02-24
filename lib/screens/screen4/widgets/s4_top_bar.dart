import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class S4TopBar extends StatelessWidget {
  const S4TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: AppColors.s4TopBarBg,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Search
          Container(
            width: 220,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.s4PageBg,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.s4Border),
            ),
            child: const Row(
              children: [
                SizedBox(width: 12),
                Icon(
                  Icons.search_rounded,
                  size: 16,
                  color: AppColors.s4TextSecondary,
                ),
                SizedBox(width: 8),
                Text(
                  'Quick search',
                  style: TextStyle(
                    color: AppColors.s4TextSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Bell
          _IconBtn(icon: Icons.notifications_outlined),
          const SizedBox(width: 8),
          // Settings
          _IconBtn(icon: Icons.settings_outlined),
          const SizedBox(width: 16),

          // User chip
          Row(
            children: [
              ClipOval(
                child: SizedBox(
                  width: 34,
                  height: 34,
                  child: Image.network(
                    'https://picsum.photos/seed/michaeljohnson/80/80',
                    fit: BoxFit.cover,
                    errorBuilder: (_, e, s) => Container(
                      color: const Color(0xFF5C6BC0),
                      alignment: Alignment.center,
                      child: const Text(
                        'MJ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Michael Johnson',
                    style: TextStyle(
                      color: AppColors.s4TextPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'm.johnson@finex.com',
                    style: TextStyle(
                      color: AppColors.s4TextSecondary,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(width: 20),

          // Add widget button
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded, size: 16),
            label: const Text(
              'Add widget',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.s4TextPrimary,
              side: const BorderSide(color: AppColors.s4Border),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  const _IconBtn({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.s4PageBg,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColors.s4Border),
      ),
      child: Icon(icon, size: 18, color: AppColors.s4TextSecondary),
    );
  }
}
