import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 168,
      decoration: BoxDecoration(
        color: AppColors.bannerBg,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Decorative blobs
          Positioned(
            right: 240,
            top: -30,
            child: _Blob(
              width: 140,
              height: 140,
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
          Positioned(
            right: 300,
            bottom: -20,
            child: _Blob(
              width: 100,
              height: 100,
              color: Colors.white.withValues(alpha: 0.3),
            ),
          ),

          // Left content
          Padding(
            padding: const EdgeInsets.only(left: 32, top: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back, Ronak !',
                  style: AppTextStyles.welcomeTitle,
                ),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'You have ',
                        style: AppTextStyles.welcomeSubtitle,
                      ),
                      TextSpan(text: '10', style: AppTextStyles.welcomeCount),
                      TextSpan(
                        text: ' task to finish today.',
                        style: AppTextStyles.welcomeSubtitle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Check now'),
                ),
              ],
            ),
          ),

          // Right illustration area
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 260,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDDE1F5),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Cloud top right
                  Positioned(top: 12, right: 20, child: _CloudShape()),
                  // Calendar illustration
                  Positioned(
                    top: 14,
                    right: 70,
                    child: _CalendarIllustration(),
                  ),
                  // Character illustration placeholder
                  Positioned(
                    bottom: 0,
                    right: 24,
                    child: _CharacterIllustration(),
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

class _Blob extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const _Blob({required this.width, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _CloudShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 22,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const SizedBox(width: 4),
        Container(
          width: 30,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}

class _CalendarIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Calendar header
          Container(
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xFF5C6BC0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: Text(
                '02',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          // Calendar body with check marks
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _CalendarCell(symbol: '✓', color: AppColors.accentGreen),
                      _CalendarCell(symbol: '✗', color: Colors.red[300]!),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _CalendarCell(symbol: '✓', color: AppColors.accentGreen),
                      _CalendarCell(symbol: '✗', color: Colors.red[300]!),
                    ],
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

class _CalendarCell extends StatelessWidget {
  final String symbol;
  final Color color;
  const _CalendarCell({required this.symbol, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      symbol,
      style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w700),
    );
  }
}

class _CharacterIllustration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Stylized character using Flutter shapes
    return SizedBox(
      width: 110,
      height: 130,
      child: CustomPaint(painter: _CharacterPainter()),
    );
  }
}

class _CharacterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final skinPaint = Paint()..color = const Color(0xFFFFC1A0);
    final outfitPaint = Paint()..color = const Color(0xFF3A3A5C);
    final bagPaint = Paint()..color = const Color(0xFFFFAA33);
    final hatPaint = Paint()..color = const Color(0xFFFFAA33);
    final shoesPaint = Paint()..color = const Color(0xFF2C2C4A);

    // Legs
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.3, size.height * 0.65, 16, 40),
        const Radius.circular(8),
      ),
      outfitPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.52, size.height * 0.65, 16, 40),
        const Radius.circular(8),
      ),
      outfitPaint,
    );

    // Shoes
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.26, size.height * 0.88, 22, 10),
        const Radius.circular(5),
      ),
      shoesPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.50, size.height * 0.88, 22, 10),
        const Radius.circular(5),
      ),
      shoesPaint,
    );

    // Body
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.22, size.height * 0.38, 52, 30),
        const Radius.circular(10),
      ),
      outfitPaint,
    );

    // Backpack
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.56, size.height * 0.34, 28, 34),
        const Radius.circular(8),
      ),
      bagPaint,
    );

    // Left arm (reaching forward)
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.10, size.height * 0.40, 14, 28),
        const Radius.circular(7),
      ),
      skinPaint,
    );

    // Head
    canvas.drawOval(
      Rect.fromLTWH(size.width * 0.26, size.height * 0.10, 44, 38),
      skinPaint,
    );

    // Hat
    final hatPath = Path();
    hatPath.moveTo(size.width * 0.20, size.height * 0.20);
    hatPath.lineTo(size.width * 0.78, size.height * 0.20);
    hatPath.lineTo(size.width * 0.70, size.height * 0.06);
    hatPath.lineTo(size.width * 0.30, size.height * 0.06);
    hatPath.close();
    canvas.drawPath(hatPath, hatPaint);

    // Sunglasses
    final glassesPaint = Paint()..color = const Color(0xFF2C2C4A);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.30, size.height * 0.26, 14, 9),
        const Radius.circular(4),
      ),
      glassesPaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.50, size.height * 0.26, 14, 9),
        const Radius.circular(4),
      ),
      glassesPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.44, size.height * 0.305),
      Offset(size.width * 0.50, size.height * 0.305),
      glassesPaint..strokeWidth = 1.5,
    );

    // Decorative leaf/plant
    final leafPaint = Paint()..color = const Color(0xFF7B8FC7);
    canvas.drawOval(
      Rect.fromLTWH(size.width * 0.02, size.height * 0.55, 12, 20),
      leafPaint,
    );
    canvas.drawOval(
      Rect.fromLTWH(size.width * 0.08, size.height * 0.48, 10, 22),
      leafPaint,
    );
    canvas.drawOval(Rect.fromLTWH(-2, size.height * 0.62, 14, 18), leafPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
