import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class S4RightPanel extends StatelessWidget {
  const S4RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      color: AppColors.s4CardBg,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _MyCardSection(),
            SizedBox(height: 20),
            _QuickPaymentSection(),
            SizedBox(height: 20),
            _TransactionHistorySection(),
          ],
        ),
      ),
    );
  }
}

// ── My Card ───────────────────────────────────────────────────────────────────

class _MyCardSection extends StatelessWidget {
  const _MyCardSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('My card', style: AppTextStyles.s4SectionTitle),
            const Spacer(),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add_rounded, size: 14),
              label: const Text(
                'Add card',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.s4TextPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        const Text('Quick actions', style: AppTextStyles.s4CardSubtitle),
        const SizedBox(height: 12),

        // Card switcher row
        Row(
          children: [
            // Debit card (active)
            Expanded(child: _DebitCard()),
            const SizedBox(width: 8),
            // Credit card (inactive/dimmed)
            Expanded(child: _CreditCardThumbnail()),
          ],
        ),
        const SizedBox(height: 14),

        // Quick action buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _QuickAction(icon: Icons.upload_rounded, label: 'Top up'),
            _QuickAction(icon: Icons.send_rounded, label: 'Send'),
            _QuickAction(icon: Icons.download_rounded, label: 'Reguest'),
            _QuickAction(icon: Icons.history_rounded, label: 'History'),
            _QuickAction(icon: Icons.more_horiz_rounded, label: 'More'),
          ],
        ),
      ],
    );
  }
}

class _DebitCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.s4DebitCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Debit card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              // VISA text
              const Text(
                'VISA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Card chip icon
          Container(
            width: 22,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '**** **** **** 7890',
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 2),
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Michael Johnson',
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
              ),
              Text('03/30', style: TextStyle(color: Colors.white, fontSize: 8)),
            ],
          ),
        ],
      ),
    );
  }
}

class _CreditCardThumbnail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.s4CreditCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Credit card',
                style: TextStyle(
                  color: AppColors.s4TextSecondary,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            '**** **** ****',
            style: TextStyle(
              color: AppColors.s4TextSecondary,
              fontSize: 9,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Michael John...',
            style: TextStyle(color: AppColors.s4TextSecondary, fontSize: 8),
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _QuickAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.s4PageBg,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.s4Border),
          ),
          child: Icon(icon, size: 18, color: AppColors.s4TextPrimary),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.s4TextSecondary,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

// ── Quick Payment ─────────────────────────────────────────────────────────────

class _QuickPaymentSection extends StatelessWidget {
  const _QuickPaymentSection();

  static const _contacts = [
    (
      'Davis',
      'DV',
      Color(0xFF6B8E6B),
      'https://picsum.photos/seed/davis_fin/60/60',
    ),
    (
      'Elli',
      'EL',
      Color(0xFFD4A5A5),
      'https://picsum.photos/seed/elli_fin/60/60',
    ),
    (
      'Leo',
      'LO',
      Color(0xFF8B7355),
      'https://picsum.photos/seed/leo_fin/60/60',
    ),
    (
      'Amanda',
      'AM',
      Color(0xFFA0785A),
      'https://picsum.photos/seed/amanda_fin/60/60',
    ),
    (
      'Ann',
      'AN',
      Color(0xFFB5896B),
      'https://picsum.photos/seed/ann_fin/60/60',
    ),
    (
      'Sin',
      'SI',
      Color(0xFF7B9E87),
      'https://picsum.photos/seed/sin_fin/60/60',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Quick payment', style: AppTextStyles.s4SectionTitle),
            const Spacer(),
            const Icon(
              Icons.more_vert_rounded,
              size: 18,
              color: AppColors.s4TextSecondary,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _contacts
              .map(
                (c) => _PaymentContact(
                  name: c.$1,
                  initials: c.$2,
                  color: c.$3,
                  imageUrl: c.$4,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _PaymentContact extends StatelessWidget {
  final String name;
  final String initials;
  final Color color;
  final String imageUrl;
  const _PaymentContact({
    required this.name,
    required this.initials,
    required this.color,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: SizedBox(
            width: 34,
            height: 34,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, e, s) => Container(
                color: color,
                alignment: Alignment.center,
                child: Text(
                  initials,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(
            color: AppColors.s4TextSecondary,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

// ── Transaction History ───────────────────────────────────────────────────────

class _TransactionHistorySection extends StatelessWidget {
  const _TransactionHistorySection();

  static const _transactions = [
    _TxData(
      name: 'Dividend payot',
      date: '25 Feb 2025',
      amount: '+\$1,100',
      status: 'Completed',
      statusColor: AppColors.s4TxCompleted,
      isPositive: true,
      iconBg: Color(0xFFE8F5E9),
      iconColor: Color(0xFF388E3C),
      icon: Icons.attach_money_rounded,
      logoText: 'TD',
      logoColor: Color(0xFF006400),
    ),
    _TxData(
      name: 'Corporate subscriptions',
      date: '25 Feb 2025',
      amount: '-\$6,400',
      status: 'Declined',
      statusColor: AppColors.s4TxDeclined,
      isPositive: false,
      iconBg: Color(0xFFE3F2FD),
      iconColor: Color(0xFF1565C0),
      icon: Icons.business_center_rounded,
      logoText: 'CS',
      logoColor: Color(0xFF1565C0),
    ),
    _TxData(
      name: 'Investment in ETF',
      date: '21 Feb 2025',
      amount: '-\$900',
      status: 'Completed',
      statusColor: AppColors.s4TxCompleted,
      isPositive: false,
      iconBg: Color(0xFFF3E5F5),
      iconColor: Color(0xFF7B1FA2),
      icon: Icons.show_chart_rounded,
      logoText: 'V',
      logoColor: Color(0xFF7B1FA2),
    ),
    _TxData(
      name: 'Consulting services',
      date: '21 Feb 2025',
      amount: '-\$2,100',
      status: 'Completed',
      statusColor: AppColors.s4TxCompleted,
      isPositive: false,
      iconBg: Color(0xFFFFF3E0),
      iconColor: Color(0xFFE65100),
      icon: Icons.work_outline_rounded,
      logoText: 'CNX',
      logoColor: Color(0xFFE65100),
    ),
    _TxData(
      name: 'Equipment purchase',
      date: '20 Feb 2025',
      amount: '-\$1,700',
      status: 'Completed',
      statusColor: AppColors.s4TxCompleted,
      isPositive: false,
      iconBg: Color(0xFFFCE4EC),
      iconColor: Color(0xFFC62828),
      icon: Icons.shopping_bag_outlined,
      logoText: 'amz',
      logoColor: Color(0xFFC62828),
    ),
    _TxData(
      name: 'Elli Harper',
      date: '15 Feb 2025',
      amount: '+\$600',
      status: 'Completed',
      statusColor: AppColors.s4TxCompleted,
      isPositive: true,
      iconBg: Color(0xFFE8F5E9),
      iconColor: Color(0xFF388E3C),
      icon: Icons.person_outline_rounded,
      logoText: 'EH',
      logoColor: Color(0xFF388E3C),
    ),
    _TxData(
      name: 'Davis Rowen',
      date: '15 Feb 2025',
      amount: '+\$800',
      status: 'Completed',
      statusColor: AppColors.s4TxCompleted,
      isPositive: true,
      iconBg: Color(0xFFE3F2FD),
      iconColor: Color(0xFF1565C0),
      icon: Icons.person_outline_rounded,
      logoText: 'DR',
      logoColor: Color(0xFF1565C0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Transaction history',
              style: AppTextStyles.s4SectionTitle,
            ),
            const Spacer(),
            _PeriodChip(label: '7d'),
          ],
        ),
        const SizedBox(height: 12),
        // Column headers
        const Row(
          children: [
            Icon(
              Icons.swap_vert_rounded,
              size: 14,
              color: AppColors.s4TextSecondary,
            ),
            SizedBox(width: 4),
            Expanded(child: Text('Name', style: AppTextStyles.s4TxDate)),
            Text('Amount', style: AppTextStyles.s4TxDate),
          ],
        ),
        const SizedBox(height: 8),
        Container(height: 1, color: AppColors.s4Border),
        const SizedBox(height: 8),
        ..._transactions.map((tx) => _TxRow(tx: tx)),
      ],
    );
  }
}

class _TxData {
  final String name;
  final String date;
  final String amount;
  final String status;
  final Color statusColor;
  final bool isPositive;
  final Color iconBg;
  final Color iconColor;
  final IconData icon;
  final String logoText;
  final Color logoColor;
  const _TxData({
    required this.name,
    required this.date,
    required this.amount,
    required this.status,
    required this.statusColor,
    required this.isPositive,
    required this.iconBg,
    required this.iconColor,
    required this.icon,
    required this.logoText,
    required this.logoColor,
  });
}

class _TxRow extends StatelessWidget {
  final _TxData tx;
  const _TxRow({required this.tx});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          // Logo container
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: tx.iconBg,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              tx.logoText,
              style: TextStyle(
                color: tx.logoColor,
                fontSize: tx.logoText.length > 2 ? 8 : 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.name,
                  style: AppTextStyles.s4TxName,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(tx.date, style: AppTextStyles.s4TxDate),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                tx.amount,
                style: TextStyle(
                  color: tx.isPositive
                      ? AppColors.s4UpGreen
                      : AppColors.s4TextPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                tx.status,
                style: TextStyle(
                  color: tx.statusColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PeriodChip extends StatelessWidget {
  final String label;
  const _PeriodChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.s4Border),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.s4TextSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 2),
          const Icon(
            Icons.expand_more_rounded,
            size: 13,
            color: AppColors.s4TextSecondary,
          ),
        ],
      ),
    );
  }
}
