import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SizedBox(
            width: 260,
            child: ColoredBox(
              color: Colors.black12,
              child: Center(child: Text('Sidebar')),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
