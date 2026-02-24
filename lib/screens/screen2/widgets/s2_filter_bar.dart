import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class S2FilterBar extends StatelessWidget {
  const S2FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search task
        Container(
          width: 180,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: AppColors.s2Border, width: 1),
          ),
          child: const Row(
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.search_rounded,
                size: 15,
                color: AppColors.s2TextSecondary,
              ),
              SizedBox(width: 6),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search task',
                    hintStyle: TextStyle(
                      color: AppColors.s2TextSecondary,
                      fontSize: 12,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),

        // Sort by: Stage
        _DropdownChip(label: 'Sort by:', value: 'Stage'),
        const SizedBox(width: 10),

        // Filter button
        _FilterButton(),

        const Spacer(),

        // Add New Task
        _AddTaskButton(),
      ],
    );
  }
}

class _DropdownChip extends StatelessWidget {
  final String label;
  final String value;
  const _DropdownChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColors.s2Border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.s2TextSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.s2TextPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 15,
            color: AppColors.s2TextSecondary,
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColors.s2Border, width: 1),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.tune_rounded, size: 15, color: AppColors.s2TextSecondary),
          SizedBox(width: 6),
          Text(
            'Filter',
            style: TextStyle(
              color: AppColors.s2TextPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _AddTaskButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: AppColors.s2Yellow,
        borderRadius: BorderRadius.circular(9),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add_rounded, size: 16, color: AppColors.s2TextPrimary),
          SizedBox(width: 6),
          Text(
            'Add New Task',
            style: TextStyle(
              color: AppColors.s2TextPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
