import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class S4CenterContent extends StatelessWidget {
  const S4CenterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          // Top row: balance chart + stats
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Balance chart card
                Expanded(child: const _BalanceChartCard()),
                const SizedBox(width: 16),
                // Stats column
                _StatsColumn(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Middle row: spending limit + budget tip
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: const _SpendingLimitCard()),
              const SizedBox(width: 16),
              Expanded(child: const _BudgetTipCard()),
            ],
          ),
          const SizedBox(height: 16),
          // Bottom row: cost analysis + financial health + goal tracker
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: const _CostAnalysisCard()),
                const SizedBox(width: 16),
                Expanded(child: const _FinancialHealthCard()),
                const SizedBox(width: 16),
                Expanded(child: const _GoalTrackerCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Balance Chart ─────────────────────────────────────────────────────────────

class _BalanceChartCard extends StatelessWidget {
  const _BalanceChartCard();

  static const _days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  // [savings, income, expenses] per day, normalized 0-30
  static const _data = [
    [8.0, 12.0, 4.0],
    [9.0, 14.0, 5.0],
    [7.0, 11.0, 6.0],
    [18.0, 22.0, 14.0], // Wed spike (with tooltip)
    [10.0, 15.0, 7.0],
    [5.0, 8.0, 3.0],
    [3.0, 6.0, 2.0],
  ];

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$12,450', style: AppTextStyles.s4BalanceAmount),
                  SizedBox(height: 2),
                  Text('Balance overview', style: AppTextStyles.s4BalanceLabel),
                ],
              ),
              const Spacer(),
              // Period selector
              _PeriodChip(label: '7d', active: true),
              const SizedBox(width: 8),
              const Icon(
                Icons.bar_chart_rounded,
                size: 18,
                color: AppColors.s4TextSecondary,
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.show_chart_rounded,
                size: 18,
                color: AppColors.s4TextSecondary,
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Legend
          Row(
            children: [
              _LegendDot(color: AppColors.s4ChartBar1, label: 'Savings'),
              const SizedBox(width: 14),
              _LegendDot(color: AppColors.s4ChartBar2, label: 'Income'),
              const SizedBox(width: 14),
              _LegendDot(color: AppColors.s4ChartBar3, label: 'Expenses'),
            ],
          ),
          const SizedBox(height: 16),
          // Chart
          SizedBox(
            height: 160,
            child: CustomPaint(
              painter: _BarChartPainter(data: _data, days: _days),
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PeriodChip extends StatelessWidget {
  final String label;
  final bool active;
  const _PeriodChip({required this.label, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: active ? AppColors.s4TextPrimary : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: active ? AppColors.s4TextPrimary : AppColors.s4Border,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : AppColors.s4TextSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 2),
          Icon(
            Icons.expand_more_rounded,
            size: 14,
            color: active ? Colors.white : AppColors.s4TextSecondary,
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 5),
        Text(label, style: AppTextStyles.s4BalanceLabel),
      ],
    );
  }
}

class _BarChartPainter extends CustomPainter {
  final List<List<double>> data;
  final List<String> days;
  const _BarChartPainter({required this.data, required this.days});

  @override
  void paint(Canvas canvas, Size size) {
    const double maxVal = 30;
    final double chartH = size.height - 24; // leave room for day labels
    final double groupW = size.width / data.length;
    const double barW = 10.0;
    const double gap = 3.0;
    const double groupBarTotal = barW * 3 + gap * 2;

    final colors = [
      AppColors.s4ChartBar1,
      AppColors.s4ChartBar2,
      AppColors.s4ChartBar3,
    ];

    // Grid lines
    final gridPaint = Paint()
      ..color = AppColors.s4Border
      ..strokeWidth = 1;
    final labelStyle = TextStyle(
      color: AppColors.s4TextSecondary,
      fontSize: 10,
    );

    for (int i = 0; i <= 3; i++) {
      final y = chartH - (i / 3) * chartH;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
      // y-axis labels
      final val = (maxVal * i / 3).round();
      final tp = TextPainter(
        text: TextSpan(text: '$val', style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(-tp.width - 4, y - tp.height / 2));
    }

    for (int gi = 0; gi < data.length; gi++) {
      final groupVals = data[gi];
      final centerX = groupW * gi + groupW / 2;
      final startX = centerX - groupBarTotal / 2;

      for (int bi = 0; bi < 3; bi++) {
        final val = groupVals[bi];
        final barH = (val / maxVal) * chartH;
        final x = startX + bi * (barW + gap);
        final y = chartH - barH;

        final rRect = RRect.fromRectAndCorners(
          Rect.fromLTWH(x, y, barW, barH),
          topLeft: const Radius.circular(3),
          topRight: const Radius.circular(3),
        );
        canvas.drawRRect(rRect, Paint()..color = colors[bi]);
      }

      // Tooltip on Wednesday (index 3)
      if (gi == 3) {
        final tipX = centerX - 40;
        final tipY = chartH - (22 / maxVal) * chartH - 68;
        _drawTooltip(canvas, Offset(tipX, tipY), size);
      }

      // Day label
      final tp = TextPainter(
        text: TextSpan(text: days[gi], style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(centerX - tp.width / 2, chartH + 6));
    }
  }

  void _drawTooltip(Canvas canvas, Offset pos, Size size) {
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(pos.dx, pos.dy, 90, 58),
      const Radius.circular(8),
    );
    canvas.drawRRect(rect, Paint()..color = const Color(0xFF1A1D23));

    final lines = [
      ('Wednesday, 7 Jan 2025', 9.5, AppColors.s4TextSecondary),
      ('• Savings   \$240', 11.0, Colors.white),
      ('• Income   \$700', 11.0, Colors.white),
      ('• Expenses \$460', 11.0, Colors.white),
    ];

    double dy = pos.dy + 6;
    for (final (text, size, color) in lines) {
      final tp = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(color: color, fontSize: size),
        ),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: 86);
      tp.paint(canvas, Offset(pos.dx + 6, dy));
      dy += tp.height + 1;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Stats Column ──────────────────────────────────────────────────────────────

class _StatsColumn extends StatelessWidget {
  const _StatsColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _StatCard(
            label: 'Total income',
            amount: '\$15,000',
            change: '↑ 5.1% from last month',
            changeColor: AppColors.s4UpGreen,
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: _StatCard(
            label: 'Total expences',
            amount: '\$6,700',
            change: '↑ 15.5% from last month',
            changeColor: AppColors.s4DownRed,
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: _StatCard(
            label: 'Saved balance',
            amount: '\$8,300',
            change: '↑ 20.7% from last month',
            changeColor: AppColors.s4UpGreen,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String amount;
  final String change;
  final Color changeColor;
  const _StatCard({
    required this.label,
    required this.amount,
    required this.change,
    required this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return _Card(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: AppTextStyles.s4StatLabel),
          const SizedBox(height: 6),
          Text(amount, style: AppTextStyles.s4StatAmount),
          const SizedBox(height: 4),
          Text(
            change,
            style: TextStyle(
              color: changeColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Spending Limit ────────────────────────────────────────────────────────────

class _SpendingLimitCard extends StatelessWidget {
  const _SpendingLimitCard();

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Monthly spending limit',
                      style: AppTextStyles.s4CardTitle,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.edit_outlined,
                      size: 16,
                      color: AppColors.s4TextSecondary,
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  'Recipient accounts',
                  style: AppTextStyles.s4CardSubtitle,
                ),
                const SizedBox(height: 12),
                // Progress bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: 0.86,
                    backgroundColor: AppColors.s4Border,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.s4Green,
                    ),
                    minHeight: 10,
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Text(
                      '\$8,600',
                      style: TextStyle(
                        color: AppColors.s4TextSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$10,000',
                      style: TextStyle(
                        color: AppColors.s4TextSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Budget Tip ────────────────────────────────────────────────────────────────

class _BudgetTipCard extends StatelessWidget {
  const _BudgetTipCard();

  @override
  Widget build(BuildContext context) {
    return _Card(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Optimize your budget with these quick tips',
                  style: AppTextStyles.s4CardTitle,
                ),
                const SizedBox(height: 6),
                const Text(
                  'Start preparing for the 2025 tax season by saving 10–15% for deductions.',
                  style: AppTextStyles.s4CardSubtitle,
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  child: const Row(
                    children: [
                      Text(
                        'Read more',
                        style: TextStyle(
                          color: AppColors.s4TextPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_rounded, size: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Decorative grid squares (top-right)
          Positioned(right: 12, top: 10, child: _GridDecoration()),
        ],
      ),
    );
  }
}

class _GridDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = [
      [AppColors.s4Green, AppColors.s4GreenLight, AppColors.s4Orange],
      [AppColors.s4GreenLight, AppColors.s4Green, AppColors.s4GreenLight],
      [AppColors.s4Orange, AppColors.s4GreenLight, AppColors.s4Green],
    ];
    return Column(
      children: colors
          .map(
            (row) => Row(
              children: row
                  .map(
                    (c) => Container(
                      width: 14,
                      height: 14,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: c,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

// ── Cost Analysis ─────────────────────────────────────────────────────────────

class _CostAnalysisCard extends StatelessWidget {
  const _CostAnalysisCard();

  static const _items = [
    ('Housing', 0.18, AppColors.s4Orange),
    ('Debt payments', 0.07, AppColors.s4Yellow),
    ('Food', 0.06, AppColors.s4Green),
    ('Transportation', 0.09, AppColors.s4GreenLight),
    ('Healthcare', 0.10, AppColors.s4Green),
    ('Investments', 0.17, AppColors.s4GreenDark),
    ('Other', 0.33, AppColors.s4Border),
  ];

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Cost analysis', style: AppTextStyles.s4SectionTitle),
              const Spacer(),
              _PeriodChip(label: 'January', active: false),
            ],
          ),
          const SizedBox(height: 4),
          const Text('Spending overview', style: AppTextStyles.s4CardSubtitle),
          const SizedBox(height: 12),
          const Text('\$8,450', style: AppTextStyles.s4StatAmount),
          const SizedBox(height: 12),
          // Segmented bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              height: 10,
              child: Row(
                children: _items
                    .map(
                      (item) => Expanded(
                        flex: (item.$2 * 100).round(),
                        child: Container(color: item.$3),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Legend list
          ..._items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: item.$3,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(item.$1, style: AppTextStyles.s4CostLabel),
                  ),
                  Text(
                    '${(item.$2 * 100).round()}%',
                    style: AppTextStyles.s4CostPct,
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

// ── Financial Health ──────────────────────────────────────────────────────────

class _FinancialHealthCard extends StatelessWidget {
  const _FinancialHealthCard();

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Financial health',
                style: AppTextStyles.s4SectionTitle,
              ),
              const Spacer(),
              _PeriodChip(label: '30d', active: false),
            ],
          ),
          const SizedBox(height: 2),
          const Text('Current status', style: AppTextStyles.s4CardSubtitle),
          const SizedBox(height: 16),
          // Donut gauge
          Center(
            child: SizedBox(
              width: 130,
              height: 130,
              child: CustomPaint(
                painter: _DonutPainter(value: 0.75),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '75%',
                        style: TextStyle(
                          color: AppColors.s4TextPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Of monthly\nincome saved',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.s4TextSecondary,
                          fontSize: 9,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Change
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_upward_rounded,
                size: 12,
                color: AppColors.s4UpGreen,
              ),
              SizedBox(width: 3),
              Text(
                '17.5% from last month',
                style: TextStyle(
                  color: AppColors.s4UpGreen,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Based on aggregated transaction metrics over the past 30 days',
            style: AppTextStyles.s4CardSubtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  final double value;
  const _DonutPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;
    const strokeW = 16.0;

    // Background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi,
      math.pi * 2,
      false,
      Paint()
        ..color = AppColors.s4Border
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeW
        ..strokeCap = StrokeCap.round,
    );

    // Value arc (lime-green, segmented look)
    final sweepAngle = math.pi * 2 * value;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      Paint()
        ..color = AppColors.s4Green
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeW
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Goal Tracker ──────────────────────────────────────────────────────────────

class _GoalTrackerCard extends StatelessWidget {
  const _GoalTrackerCard();

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Goal tracker', style: AppTextStyles.s4SectionTitle),
              const Spacer(),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_rounded, size: 14),
                label: const Text('Add goals', style: TextStyle(fontSize: 12)),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.s4TextPrimary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text('This year', style: AppTextStyles.s4CardSubtitle),
          const SizedBox(height: 12),
          _GoalItem(
            label: 'Reserve',
            current: 7000,
            target: 10000,
            timeLeft: 'Left to save 4 months',
            imageUrl: 'https://picsum.photos/seed/goalreserve/80/60',
            barColor: AppColors.s4Green,
          ),
          const SizedBox(height: 8),
          const Text('Long term', style: AppTextStyles.s4CardSubtitle),
          const SizedBox(height: 10),
          _GoalItem(
            label: 'Travel',
            current: 2500,
            target: 4000,
            timeLeft: 'Left to save 3 months',
            imageUrl: 'https://picsum.photos/seed/goaltravel/80/60',
            barColor: AppColors.s4Orange,
          ),
          const SizedBox(height: 8),
          _GoalItem(
            label: 'Car',
            current: 1600,
            target: 20000,
            timeLeft: 'Left to save 3 years 6 months',
            imageUrl: 'https://picsum.photos/seed/goalcar/80/60',
            barColor: AppColors.s4Orange,
          ),
          const SizedBox(height: 8),
          _GoalItem(
            label: 'Real estate',
            current: 8300,
            target: 10000,
            timeLeft: 'Left to save 5 years 8 months',
            imageUrl: 'https://picsum.photos/seed/goalestate/80/60',
            barColor: AppColors.s4Orange,
          ),
        ],
      ),
    );
  }
}

class _GoalItem extends StatelessWidget {
  final String label;
  final double current;
  final double target;
  final String timeLeft;
  final String imageUrl;
  final Color barColor;
  const _GoalItem({
    required this.label,
    required this.current,
    required this.target,
    required this.timeLeft,
    required this.imageUrl,
    required this.barColor,
  });

  String _fmt(double v) {
    if (v >= 1000) return '\$${(v / 1000).toStringAsFixed(0)}K';
    return '\$${v.round()}';
  }

  @override
  Widget build(BuildContext context) {
    final progress = (current / target).clamp(0.0, 1.0);
    return Row(
      children: [
        // Thumbnail
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 44,
            height: 40,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, e, s) =>
                  Container(color: AppColors.s4GreenLight),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(label, style: AppTextStyles.s4GoalTitle),
                  const Spacer(),
                  Text(
                    '${_fmt(current)}/${_fmt(target)}',
                    style: AppTextStyles.s4GoalMeta,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 5,
                  backgroundColor: AppColors.s4Border,
                  valueColor: AlwaysStoppedAnimation<Color>(barColor),
                ),
              ),
              const SizedBox(height: 4),
              Text(timeLeft, style: AppTextStyles.s4GoalMeta),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Shared Card container ─────────────────────────────────────────────────────

class _Card extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const _Card({required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.s4CardBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.s4Border),
      ),
      child: child,
    );
  }
}
