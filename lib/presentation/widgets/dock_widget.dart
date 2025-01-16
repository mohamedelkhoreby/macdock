import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../widgets/dock.dart';

class DockWidget extends HookWidget {
  const DockWidget({super.key, required this.items});

  final List<IconData> items;

  @override
  Widget build(BuildContext context) {
    return Dock<IconData>(
      items: items,
      builder: (icon, isDragging) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          constraints: const BoxConstraints(minWidth: 48),
          height: isDragging ? 64 : 48,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.primaries[icon.hashCode % Colors.primaries.length],
            boxShadow: isDragging
                ? [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 3,
                    )
                  ]
                : [],
          ),
          child: Center(child: Icon(icon, color: Colors.white)),
        );
      },
    );
  }
}

