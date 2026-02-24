import 'package:flutter/material.dart';

import 'screens/screen1/screen1.dart';
import 'screens/screen2/screen2.dart';
import 'screens/screen3/screen3.dart';
import 'screens/screen4/screen4.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentScreen = 4;

  Widget _buildScreen() {
    switch (_currentScreen) {
      case 1:
        return const DashboardScreen();
      case 2:
        return const Screen2();
      case 3:
        return const Screen3();
      case 4:
        return const Screen4();
      default:
        return const DashboardScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Designs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          brightness: Brightness.light,
        ),
      ),
      home: Stack(
        children: [
          _buildScreen(),

          // Screen switcher pill — bottom center
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: _ScreenSwitcher(
                current: _currentScreen,
                onSwitch: (i) => setState(() => _currentScreen = i),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenSwitcher extends StatelessWidget {
  final int current;
  final ValueChanged<int> onSwitch;
  const _ScreenSwitcher({required this.current, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.65),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [1, 2, 3, 4].map((i) {
            final isActive = i == current;
            return GestureDetector(
              onTap: () => onSwitch(i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  'Screen $i',
                  style: TextStyle(
                    color: isActive ? Colors.black87 : Colors.white70,
                    fontSize: 12,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
