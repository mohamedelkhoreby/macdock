import 'package:flutter/material.dart';

class Dock<T extends Object> extends StatefulWidget {
  const Dock({
    super.key,
    required this.items,
    required this.builder,
  });

  final List<T> items;
  final Widget Function(T item, bool isDragging) builder;

  @override
  State<Dock<T>> createState() => _DockState<T>();
}

class _DockState<T extends Object> extends State<Dock<T>> {
  late List<T> _items;
  T? _draggingItem;

  @override
  void initState() {
    super.initState();
    _items = widget.items.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _items.map((item) {
          final isDragging = _draggingItem == item;

          return Draggable<T>(
            data: item,
            feedback: Material(
              color: Colors.transparent,
              child: widget.builder(item, true),
            ),
            childWhenDragging: Opacity(
              opacity: 0.5,
              child: widget.builder(item, false),
            ),
            onDragStarted: () => setState(() {
              _draggingItem = item;
            }),
            onDragEnd: (_) => setState(() {
              _draggingItem = null;
            }),
            child: DragTarget<T>(
              onWillAcceptWithDetails: (data) => data != item,
              onAcceptWithDetails: (data) {
                setState(() {
                  final oldIndex = _items.indexOf(data.data);
                  final newIndex = _items.indexOf(item);
                  _items.removeAt(oldIndex);
                  _items.insert(newIndex, data.data);
                });
              },
              builder: (context, candidateData, rejectedData) {
                return widget.builder(item, isDragging);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
